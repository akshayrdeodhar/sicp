#lang sicp
(define rem remainder)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (rem a b))))

(gcd 206 40) ; 206 40- 0 0
(gcd 40 (rem 206 40)) ;40 6- 1 1
(gcd (rem 206 40) (rem 40 (rem 206 40))) ; 6 4- 2 3
(gcd (rem 40 (rem 206 40)) (rem (rem 206 40) (rem 40 (rem 206 40)))) ;4 2- 4 7
(gcd (rem (rem 206 40) (rem 40 (rem 206 40))) (rem (rem 40 (rem 206 40)) (rem (rem 206 40) (rem 40 (rem 206 40))))) ; 2 0- 7 14
;we hit (= b 0) here
;now a is evaluated-4 remainder evaluations
;Total- 14 + 4 = 18

;For apply-eval
(gcd 206 40) ;0
(gcd 40 6); 1
(gcd 6 4); 2
(gcd 4 2) ; 3
(gcd 2 0) ; 4
;Only four remainder evaluations
