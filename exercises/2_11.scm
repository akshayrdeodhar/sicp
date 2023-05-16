(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let
      ((lx (lower-bound x))
       (ux (upper-bound x))
       (ly (lower-bound y))
       (uy (upper-bound y)))
    (cond ((>= lx 0)
           (cond
             ((>= ly 0) (make-interval (* lx ly) (* ux uy))) ; + +
             ((< uy 0) (make-interval (* ux ly) (* lx uy)))  ; + -
             (else (make-interval (* ux ly) (* ux uy)))))    ; + mix
          ((< ux 0)
           (cond
             ((>= ly 0) (make-interval (* lx uy) (* ux ly))) ; - +
             ((< uy 0) (make-interval (* ux uy) (* lx ly)))  ; - -
             (else (make-interval (* lx uy) (* lx ly)))))    ; - mix
          (else
           (cond
             ((>= ly 0) (make-interval (* lx uy) (* ux uy)))
             ((< uy 0) (make-interval (* ux ly) (* lx ly)))
             (else (make-interval (min (* lx uy) (* ux ly))
                                  (max (* lx ly) (* ux uy)))))))))
                                       
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

(define aplus (make-interval 1 2))
(define aminus (make-interval (- 2) (- 1)))
(define amix (make-interval (- 2) 1))

(mul-interval aplus aplus)
(mul-interval aplus aminus)
(mul-interval aplus amix)
(mul-interval aminus aplus)
(mul-interval aminus aminus)
(mul-interval aminus amix)
(mul-interval amix aplus)
(mul-interval amix aminus)
(mul-interval amix amix)