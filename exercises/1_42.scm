(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc x)
  (+ x 1))

(define square
  (lambda (x) (* x x)))

((compose square inc) 6)

