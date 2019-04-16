#lang sicp
(define (f-r n)
  (if (< n 3)
      n
      (+ (f-r (- n 1)) (* 2 (f-r (- n 2))) (* 3 (f-r (- n 3))))))

(define (f-i n)
  (define (f three two one i n)
    (if (= i n)
        (+ one (*  2 two) (* three 3))
        (f two one (+ one (* 2 two) (* 3 three)) (+ i 1) n)))
  (if (< n 3)
      n
      (f 0 1 2 3 n)))
        
        
