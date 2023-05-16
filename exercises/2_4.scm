(define (cons x y)
  (lambda (m) (m x y)))
; cons is a function that takes inputs x and y
; and returns a function taking a single argument 'm'
; which returns the result of applying m to x and y

(define (car z)
  (z (lambda (p q) p)))

; car is a function taking one argument z
; which returns the result of applying z to the lambda function
; which takes two arguments, and returns the first

; (car (cons x y))
; returns the result of applying (cons x y) to the lambda function which takes two arguments and returns the first
; i.e returns the result of applying the lambda function which takes two arguments and returns the first to x and y
;i.e returns x
; so, (car (cons x y)) -> x


; ((lambda (m) (m x y)) (lambda (p q) p))
; ((lambda (p q) p) x y)
; x

(define (cdr z)
  (z (lambda (p q) q)))