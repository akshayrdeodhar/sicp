#lang sicp
(define (half x) (/ x 2))
(define (double x) (+ x x))
(define (even? n) (= (remainder n 2) 0))
;invariant: r + a * b
(define (mult a b)
  (define (iter-mult r a b)
    (if (= b 0)
        r
        (if (even? b)
            (iter-mult r (double a) (half b))
            (iter-mult (+ r a) a (- b 1)))))
  (iter-mult 0 a b))