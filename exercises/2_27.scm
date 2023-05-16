#lang sicp
(define (deep-reverse l)
  (define (iter remaining constructed)
    (if (null? remaining)
      constructed 
      (iter (cdr remaining) (cons (deep-reverse (car remaining)) constructed))))
  (if (pair? l)
      (iter l nil)
      l))

(define x (list (list 1 2) (list 3 4) 5 6))
(deep-reverse x)
