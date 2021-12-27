<<<<<<< HEAD
#lang sicp
(define x (list 1 2 3))
(define y (list 4 5 6))

(define q1 (append x y))
;a1 (1 2 3 4 5 6)
(define a1 (list 1 2 3 4 5 6))

(define q2 (cons x y))
;a2 (wrong) ((1 2 3) . (4 5 6))
;a2 ((1 2 3) 4 5 6)
(define a2 (list (list 1 2 3) 4 5 6))

(define q3 (list x y))
(define a3 (list (list 1 2 3) (list 4 5 6)))
;a3 ((1 2 3) (4 5 6))

