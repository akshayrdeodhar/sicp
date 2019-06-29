(define square (lambda(x) (* x x)))

(define (manual-square-list l)
  (if (null? l)
    nil
    (cons (square (car l)) (manual-square-list (cdr l)))))

(define (mapped-square-list l)
  (map square l))

(define one-to-four (list 1 2 3 4))

(manual-square-list one-to-four)
(mapped-square-list one-to-four)
