(define (for-each proc l)
  (cond
    ((null? l) #t)
    (else
      (proc (car l))
      (for-each proc (cdr l)))))

(for-each (lambda(x) (newline) (display x)) (list 1 2 3 4 5))

; What I do not understand is
; (cond .. (else (execute ..) (call ..))) works
; but (if () ((execute ..) (call ..))) does not
