(define (reverse l)
  (define (iter remaining constructed)
    (if (null? remaining)
      remaining
      (iter (cdr remaining) (cons (car remaining) constructed))))
  (iter l nil))
