(define (filtered-accumulate filter combiner null-value term a next b)
  (define (filtered-term x)
    (if (filter x)
        (term x)
        null-value))
  (define (iter i result)
    (if (> i b)
        result
        (iter (next i) (combiner result (filtered-term i)))))
  (iter a null-value))

(define (add_even n)
  (define (even? n)
    (= (remainder n 2) 0))
  (filtered-accumulate even? + 0 (lambda(x) x) 1 (lambda(x) (+ x 1)) n))


; b
(define (gcd a b)
  (define (lgcd a b)
    (if (= a 0)
        b
        (lgcd (remainder b a) a)))
  (if (< a b)
      (lgcd a b)
      (lgcd b a)))

;(gcd 24 28)
;(lgcd 24 28)
;(lgcd 4 24)
;(lgcd 0 4)
;4

(define (relprimesum n)
  (filtered-accumulate (lambda(x) (= 1 (gcd x n))) + 0 (lambda(x) x) 1 (lambda(x) (+ x 1)) n))