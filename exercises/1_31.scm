(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (factorial n)
  (product (lambda(x) x) 1 (lambda(x) (+ x 1)) n))

(define (pi n)
  (define (odd? n)
    (= 1 (remainder n 2)))
  (define (term n) (+ n 2))
  (define (upper-term n)
    (if (odd? n)
        (term (- n 1))
        (term n)))
  (define (lower-term n)
    (if (odd? n)
        (term n)
        (term (- n 1))))
  (*
    4
   (product (lambda(x) (/ (upper-term x) (lower-term x))) 1 (lambda(x) (+ x 1)) n))) 