; phi^2 = phi + 1
; Dividing on both sides by phi
; phi = 1 + 1/phi
; Thus, phi is the fixed point of the functions y -> 1 + 1/y

(define (fixed-point f initial)
  (define err 0.00001)
  (define (close-enough a b)
    (> err (abs (- a b))))
  (if (close-enough initial (f initial))
      (f initial)
      (fixed-point f (f initial))))

(define golden-ratio
  (fixed-point (lambda(x) (+ 1 (/ 1 x))) 1))
