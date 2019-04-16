; distribution code starts here
(define (square n) (* n n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next n)
  (if (= n 2)
    3
    (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
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

;The ratio seems to move from 1 -> 2 but I am not sure whether it will touch (= y 2)
;Maybe in the beginning the cost of running the 'if' matters when next is called
;as number of evaluations rises, it becomes dominant?
