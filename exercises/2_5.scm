; 2 and 3 have gcd 1
; so any number that is a product of only powers of 2 and 3 can be factorized into 2 and 3

(define (cons a b)
  (define (pow a b)
    (define (iter a b prod)
      (if (= b 0)
          prod
          (iter a (- b 1) (* prod a))))
    (iter a b 1))
  (* (pow 2 a) (pow 3 b)))


(define (findpow a divisor)
  (define (iter a count)
    (if (= (remainder a divisor) 0)
        (iter (/ a divisor) (+ count 1))
        count))
  (iter a 0))

(define (car z)
  (findpow z 2))

(define (cdr z)
  (findpow z 3))