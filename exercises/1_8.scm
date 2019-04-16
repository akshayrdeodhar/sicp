#lang sicp
(define (cuberoot x)
  (define (sqr x) (* x x))
  (define (cube x) (* x (sqr x)))
  (define (average x y z) (/ (+ x y z) 3))
  (define (improve g x) (average (/ x (sqr g)) g g))
  (define (good-enough g x) (< (abs (- (cube g) x)) 0.0001))
  (define (iter g x)
    (if (good-enough g x)
        g
        (iter (improve g x) x)))
  (iter 1 x))
