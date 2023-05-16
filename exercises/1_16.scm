#lang sicp
;invarient:
;(a * b^n) is constant
(define (invr-expt b n)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (raised a b n)
    (if (= n 0)
        a
        (if (even? n)
            (raised a (* b b) (/ n 2))
            (raised (* a b) b (- n 1)))))
  (raised 1 b n))