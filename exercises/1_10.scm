#lang sicp
(define (A x y) 
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1)
		 (A x (- y 1))))))
;(A 0 1) = 2
;(A 0 2) = 4
;(A 0 n) = 2n
;
;(A 1 10)
;(A 0 (A 1 9))
;(A 0 (A 0 (A 1 8)))
;(A 0 (A 0 (A 0 (A 1 7))))
;.
;.
;.
;(A 0 (A 0 (A ... (A 1 1) ...)))
;
;(A 1 1) = 2
;(A 1 2) = (A 0 (A 1 1)) = 4
;(A 1 n) = 2^n
;(A 1 (+ n 1)) = (A 0 (A 1 n)) = (* 2 (2^n)) = 2^(n + 1) !
;
;By induction: 2^n
;
;(A 2 4)
;(A 1 (A 2 3))
;(A 1 (A 1 (A 2 2)))
;(A 1 (A 1 (A 1 (A 2 1))))
;(A 1 (A 1 (A 1 2)))
;2^(2^(2^(2))) = 2^(2^4) = 2^16
;(A 2 1) = 2
;(A 2 2) = (A 1 (A 2 1)) = 2^2 = 4
;(A 2 3) = (A 1 (A 2 2)) = 2^(2^(2))
;I do not think it is possible to give a definition that does not involve ...
;Answers:
;(A 1 10) = 2^10 = 1024
;
;(A 2 4) = 2^(2^(2^2)) = 2^16 = 65536
;
;(A 3 3)
;(A 2 (A 3 2))
;(A 2 (A 2 (A 3 1)))
;(A 2 (A 2 2))
;(A 2 (A 1 (A 2 1)))
;(A 2 (A 1 2))
;(A 2 4)
;65536
;
;(f n) = (A 0 n) = 2 * n
;(g n) = (A 1 n) = 2 ^ n
;(h n) = (A 2 n) is 2 ^ (2 ^ ... n times) (total n 2s)
	
(define (pow a b)
  (define (powter i a b p)
    (if (= i b)
        p
        (powter (+ i 1) a b (* p a))))
  (powter 0 a b 1))


