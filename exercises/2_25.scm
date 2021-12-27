#lang sicp
(define exp1 (list 1 3 (list 5 7) 9))
(define exp2 (list (list 7)))
(define exp3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(define s1 (car (cdr (caddr exp1))))
(define s2 (caar exp2))
(define s3 (cadr (cadr (cadr (cadr (cadr (cadr exp3)))))))
