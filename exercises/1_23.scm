(define (square n) (* n n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	  (remainder (* base (expmod base (- exp 1) m))
		     m))))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))

(define times 5)

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n times)
    (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

;1013 *** 73 65
;1019 *** 70 64
;10007 *** 143 198 
;10009 *** 158 223
;10037 *** 144 197
;100003 *** 437 625
;100019 *** 429 623
;100043 *** 425 617
;1000003 *** 1299 1984
;1000033 *** 1300 2011
;1000037 *** 1421 2016
;10000019 *** 4143 6653
;10000079 *** 4137 6331
;10000103 *** 4243 6327


