(define (double f)
  (lambda(x) (f (f x))))

(define inc
  (lambda(x) (+ x 1)))

;13
;Wrong

;(define 2double (double double))
;(double double)
;->(double (double
;(double (double double))
;(double (double (double (double
;(((double (double double)) inc)
;(double (double (double (double inc))))
;(double (double (double (inc (inc
;(double (double (inc (inc (inc (inc
;(double (inc (inc (inc (inc
;... I get the idea.

;21