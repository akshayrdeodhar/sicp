(define (make-rat p q)
  (if (and (< q 0) (not (< p 0)))
      (cons (- p) (- q))
      (cons p q)))

(define (numer r)
  (car r))

(define (denom r)
  (cdr r))
