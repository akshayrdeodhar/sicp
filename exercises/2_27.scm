#lang sicp
(define (deep-reverse l)
  (define (iter remaining constructed)
    (if (null? remaining)
      constructed 
      (iter (cdr remaining) (cons (deep-reverse (car remaining)) constructed))))
  (if (pair? l)
      (iter l nil)
      l))
