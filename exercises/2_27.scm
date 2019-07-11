(define (deep-reverse l)
  (define (iter remaining constructed)
    (cond
      ((null? remaining) constructed)
      ((not (pair? (car remaining))) (iter (cdr remaining) (cons (car remaining) constructed)))
      ; not null, and car is a pair. So car is a list
      (else (iter (cdr remaining) (cons (deep-reverse (car remaining)) constructed)))))
  (iter l nil))

(define x (list (list 1 2) (list 3 4) 5 6))
(deep-reverse x)
