(define (smallest-divisor n)
  (find-divisor n 2))

(define (square x) (* x x))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? d n) (= (remainder n d) 0))

(smallest-divisor 199) ;199
(smallest-divisor 1999) ;1999
(smallest-divisor 19999) ;19999


