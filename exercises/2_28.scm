#lang sicp
(define (fringe-rec l)
  (cond ((null? l) l)
        ((not (pair? l)) (list l))
        (else (append (fringe-rec (car l)) (fringe-rec (cdr l))))))

(define (fringe-iter l)
  (define (iter remaining constructed)
    (if (null? remaining)
        constructed
        (iter (cdr remaining) (append constructed (fringe-iter (car remaining))))))
  (cond
    ((null? l) nil)
    ((not (pair? l)) (list l))
    (else (iter l nil))))
