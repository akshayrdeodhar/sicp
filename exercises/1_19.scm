#lang sicp
;(Tpq (a, b)) = (bq + aq + ap, bp + aq)
;(Tpq (Tpq (a, b))) = (Tpq (bq + aq + ap, bp + aq))
;		    = (Tp'q' (a, b))
; where p' = (p^2 + q^2)
;       q' = (2pq + q^2)
;Now, for Fibonacci 
;(F (a, b)) = (T01 (a, b))
;(T01 (T01 (a, b))) = (T11 (a, b))
;Thus we are effectively squaring F
;(Fsq (a, b)) = (b + 2a, b + a)
; (why did we prove T^2 is also of form T then?)
; Because we are going to successively square Tpq- not just T01 !!!!
;This is awesome
(define (old-fib n)
  (if (< n 2)
      n
      (+ (old-fib (- n 1)) (old-fib (- n 2)))))

(define (even? n) (= (remainder n 2) 0))
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
	((even? count)
	 (fib-iter a
		   b
		   (+ (* p p) (* q q))
		   (+ (* 2 p q) (* q q))
		   (/ count 2)))
	(else (fib-iter (+ (* b q) (* a q) (* a p))
			(+ (* b p) (* a q))
			p
			q
			(- count 1)))))

;(T^n (a, b)) = (T^(2^(n / 2)) (a, b)) n even
;             = (T^(n - 1) (T (a, b))) n odd
