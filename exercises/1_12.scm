#lang sicp
(define (pascal element row)
  (if
    (or (= row 0) (= row 1) (= element row) (= element 0))
    1
    (+ (pascal (- element 1) (- row 1)) (pascal element (- row 1)))))