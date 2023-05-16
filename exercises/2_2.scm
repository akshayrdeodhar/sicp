(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-seg p1 p2) (cons p1 p2))

(define (seg-start s) (car s))

(define (seg-end s) (cdr s))

(define (midpoint s)
  (make-point (/
               (+
                 (x-point (seg-start s))
                 (x-point (seg-end s)))
               2)
              (/
               (+
                (y-point (seg-start s))
                (y-point (seg-end s)))
               2)))

(define (print-seg s)
  (newline)
  (display "(")
  (print-point (seg-start s))
  (display ", ")
  (print-point (seg-end s))
  (display ")")
  (newline))

(define origin (make-point 0 0))
(define wun-wun (make-point 2 2))
(define ourseg (make-seg origin wun-wun))
(define midpoint (midpoint ourseg))
(print-point origin)
(print-point wun-wun)
(print-seg ourseg)
(print-point midpoint)