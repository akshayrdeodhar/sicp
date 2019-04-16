#lang sicp
(define (half x) (/ x 2))
(define (double x) (+ x x))
(define (even? n) (= (remainder n 2) 0))
(define (fast-mult a b)
  (cond
    ((= b 0) 0)
    ((even? b) (fast-mult (double a) (half b)))
    (else (+ a (fast-mult a (- b 1))))))
