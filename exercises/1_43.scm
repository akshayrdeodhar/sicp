(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter-rep partial-function i)
    (if (= i n)
        partial-function
        (iter-rep (lambda(x) (f (partial-function x))) (+ i 1))))
  (iter-rep f 1))

(define square
  (lambda(x) (* x x)))

;((repeated square 2) 5)

(define (iter-repeated f n)
  (define (true-iter i value)
    (if (= i n)
        value
        (true-iter (+ i 1) (f value))))
  (lambda(x) (true-iter 0 x)))
;Why so?