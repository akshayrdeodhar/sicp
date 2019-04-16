(define (square x) (* x x))
;Distribution code
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n i)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it i))

;My Code
(define (isfermat n)
  (define (iteratefermat n i)
    (cond
      ((= n i) true)
      ((fermat-test n i) (fermat-test n (+ i 1)))
      (else false)))
  (iteratefermat n 1))