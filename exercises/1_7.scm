(define (sqrt x)
  (define (sqr x) (* x x))
  (define (average a b) (/ (+ a b) 2))
  (define (improve g x) (average (/ x g) g))
  (define (good-enough g x) (< (abs (- (improve g x) g)) 0.0001))
  (define (sqrt-iter g x)
    (if (good-enough g x)
        g
        (sqrt-iter (improve g x) x)))
  (sqrt-iter 1 x))

(define (oldsqrt x)
  (define (sqr x) (* x x))
  (define (average a b) (/ (+ a b) 2))
  (define (improve g x) (average (/ x g) g))
  (define (good-enough g x) (< (abs (- (sqr g) x)) 0.0001))
  (define (sqrt-iter g x)
    (if (good-enough g x)
        g
        (sqrt-iter (improve g x) x)))
  (sqrt-iter 1 x))

(sqrt 9)
(oldsqrt 9)
;the new good-enough works better for small numbers
;the old good-enough works better for large numbers
;this is because the new one only tracks relative accuracy- while this solves the problem of lack of accuracy for small number
;the old one does more iterations for larger numbers, making the guess more accurate
