(define (improved-fixed-point f initial)
  (define err 0.00001)
  (define (close-enough a b)
    (> err (abs (- a b))))
  (define (average a b) (/ (+ a b) 2))
  (define (iter current count)
    (display count)
    (newline)
    (display current)
    (newline)
    (let ((next (f current)))
      (if (close-enough current next)
          next
          (iter (average current next) (+ count 1)))))
  (iter initial 0))

(define (fixed-point f initial)
  (define err 0.00001)
  (define (close-enough a b)
    (> err (abs (- a b))))
  (define (average a b) (/ (+ a b) 2))
  (define (iter current count)
    (display count)
    (newline)
    (display current)
    (newline)
    (let ((next (f current)))
      (if (close-enough current next)
          next
          (iter next (+ count 1)))))
  (iter initial 0))

(define (expself c)
  (lambda(x) (/ (log c) (log x))))

; fixed-point takes 30 steps
; improved-fixed-point takes 9