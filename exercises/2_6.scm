(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;(add-1 zero)
;(lambda (f) (lambda (x) (f ((zero f) x))))
;(lambda (f) (lambda (x) (f (((lambda (k) (lambda (y) y)) f) x))))
;(lambda (f) (lambda (x) (f ((lambda (y) y) x))))
;(lambda (f) (lambda (x) (f x)))

; Now I decide without substitution

(define one (lambda (f) (lambda (x) (f x))))
; one is a function that takes a function and returns a function which applies it once to an argument

(define two (lambda (f) (lambda (x) (f (f x)))))
; two is a function that takes a function and returns a function that applies it twice to an argument

; plus takes two 'church numerals' and returns a function that takes a single function as a single argument
; and returns a function that takes one argument and applies the 'single function' to that argument a times
; then applies that single function b times to the result
(define (plus a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

; using church numerals
(define (square x) (* x x))

(define three (plus two one))

(define to-the-8th (three square))

(to-the-8th 2)
