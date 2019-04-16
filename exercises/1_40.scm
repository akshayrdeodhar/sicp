(define (fixed-point f guess)
  (define error 0.00001)
  (define (iter x)
    (let
        ((new (f x)))
      (if (> error (abs (- new x)))
          new
          (iter new))))
  (iter guess))

(define (average-damp f)
  (lambda(x) (/ (+ x (f x)) 2)))

(define (fixed-point-of-transform f transform guess)
  (fixed-point (transform f) guess))
                        

(define (sqrt x)
  (fixed-point-of-transform (lambda(y) (/ x y)) average-damp 1))

(define (deriv f)
  (define dx 0.000001)
  (lambda(x) (/ (- (f (+ x dx))
                   (f x))
                dx)))

(define (newton-transform f)
  (lambda(x) (- x
                (/ (f x)
                   ((deriv f) x)))))

(define (newtons-method f guess)
  (fixed-point-of-transform f newton-transform guess))

(define (cubic a b c)
  (lambda(x) (+ (* x x x)
                (* a x x)
                (* b x)
                c)))

(define (sqrt-fn s)
  (lambda(x) (- s (* x x))))



