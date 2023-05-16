(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((w (/ (* c p) 100)))
    (make-center-width c w)))

(define (percent i)
  (let ((lower (lower-bound i))
        (upper (upper-bound i)))
    (* 100 (/ (- upper lower) (+ upper lower)))))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let
      ((p1 (* (lower-bound x) (lower-bound y)))
       (p2 (* (lower-bound x) (upper-bound y)))
       (p3 (* (upper-bound x) (lower-bound y)))
       (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; it does not make sense to divide by and interval around zero,
; as the limit then does not exist at endpoints but at zero, where it is not defined
(define (div-interval x y)
  (let ((ly (lower-bound y))
        (uy (upper-bound y)))
    (if (and (>= uy 0) (<= ly 0))
        (error "Dividing interval spans 0")
        (mul-interval
         x
         (make-interval (/ 1 uy)
                        (/ 1 ly))))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

(define a (make-center-width 10 0.37))
(percent a)

(define b (make-center-percent 5 10))
(lower-bound b)
(width b)

; actual 2.13 starts here
; for small percentage tolerances
(define a (make-center-percent 100 1))
(define b (make-center-percent 200 1))

; as (* sa sb) is approximately 0,
; and assuming all numbers to be positive
; the lower bound of the product will be

(display "Lower Bound: ")
(- (* (center a) (center b)) (+ (* (center a) (width b)) (* (center b) (width a))))

; and the upper bound will be

(display "Upper Bound: ")
(+ (* (center a) (center b)) (* (center a) (width b)) (* (center b) (width a)))

; so the width will be

(display "Width: ")
(+ (* (center a) (width b)) (* (center b) (width a)))

; the new center will be

(display "Center: ")
(* (center a) (center b))

; so the percentage width will be

(display "Percentage Width: ")
(* 100
   (/ (+ (* (center a) (width b)) (* (center b) (width a)))
      (* (center a) (center b))))

; which is

(display "Percentage Width: ")
(* 100
   (+ (/ (width b) (center b))
      (/ (width a) (center a))))

; but width is (/ 100 (* percentage center))
; so the final percentage is

(display "Percentage Width: ")
(+ (percent a) (percent b))