(define (same-parity first . l)
  (define (iter remaining mod)
    (if (null? remaining)
        nil
        (if (= mod (remainder (car remaining) 2))
            (cons (car remaining) (iter (cdr remaining) mod))
            (iter (cdr remaining) mod))))
    (let ((mod (remainder first 2)))
      (iter l (remainder first 2))))

(same-parity 1 2 3 4 5 6)
  
