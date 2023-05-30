#lang sicp
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; fold-right = accumulate
(define fold-right accumulate)

(fold-right / 1 (list 1 2 3))
; (div 1 (div 2 (div 3 1))) -> 3/2

(fold-left / 1 (list 1 2 3))
; (iter 1 (1 2 3)) -> (iter (div 1 1) (2 3)) -> (iter (div 1 2) (3)) -> (iter (div 0 3) nil) -> 1/6

(fold-right list nil (list 1 2 3))
; (list 1 (list 2 (list 3 nil))) -> (1 (2 (3 nil)))

(fold-left list nil (list 1 2 3))
; (nil 1) -> ((nil 1) 2) -> (((nil 1) 2) 3)