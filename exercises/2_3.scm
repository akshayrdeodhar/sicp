(define (make-seg p1 p2) (cons p1 p2))

(define (seg-start s) (car s))

(define (seg-end s) (cdr s))

(define (sqr x) (* x x))

(define pi (* 2 (asin 1)))

(define (length seg)
  (sqrt (+
         (sqr (- (x-comp (seg-start seg)) (x-comp (seg-end seg))))
         (sqr (- (y-comp (seg-start seg)) (y-comp (seg-end seg)))))))

(define (make-vec-seg seg)
  (cons (- (x-comp (seg-end seg)) (x-comp (seg-start seg)))
        (- (y-comp (seg-end seg)) (y-comp (seg-start seg)))))

(define (make-vec-comp dx dy)
  (cons dx dy))

(define (x-comp vector)
  (car vector))

(define (y-comp vector)
  (cdr vector))

(define (scale vec scalar)
  (make-vec-comp (* scalar (x-comp vec)) (* scalar (y-comp vec))))

(define (rotate vec angle)
  (let ((c (cos angle))
        (s (sin angle))
        (x (x-comp vec))
        (y (y-comp vec)))
    (make-vec-comp (+ (* c x) (* (- s) y))
                   (+ (* (- c) x) (* s y)))))

(define (add-vec vec1 vec2)
  (make-vec-comp (+ (x-comp vec1) (x-comp vec2))
                 (+ (y-comp vec1) (y-comp vec2))))

(define (make-rect base-seg height)
  (cons base-seg height))

(define (point1 rect)
  (seg-start (car rect)))

(define (point2 rect)
  (seg-end (car rect)))
  
(define (point3 rect)
  (let ((start-pos (seg-end (car rect)))
        (scaling (/ (cdr rect) (length (car rect))))
        (base-seg (car rect)))
    (add-vec start-pos
             (scale
              (rotate (make-vec-seg base-seg) pi)
              scaling))))


(define (point4 rect)
  (let ((start-pos (seg-start (car rect)))
        (scaling (/ (cdr rect) (length (car rect))))
        (base-seg (car rect)))
    (add-vec start-pos
             (scale
              (rotate (make-vec-seg base-seg) pi)
              scaling))))

(define (perimeter rect)
  (let ((base (length (make-seg (point1 rect) (point2 rect))))
        (height (length (make-seg (point2 rect) (point3 rect)))))
    (* 2
       (+
        base
        height))))

(define (area rect)
  (let ((base (length (make-seg (point1 rect) (point2 rect))))
        (height (length (make-seg (point2 rect) (point3 rect)))))
    (* base height)))

(define origin (make-vec-comp 0 0))
(define wun-wun (make-vec-comp 1 1))
(define our-seg (make-seg origin wun-wun))
(define height (sqrt 2))
(define our-rect (make-rect our-seg height))
(point1 our-rect)
(point2 our-rect)
(point3 our-rect)
(point4 our-rect)
(perimeter our-rect)
(area our-rect)
