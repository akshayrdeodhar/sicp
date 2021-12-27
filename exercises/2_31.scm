(define (tree-map proc t)
  (map
   (lambda (t)
     (if (pair? t)
         (tree-map proc t)
         (proc t)))
  t))

(define (other-tree-map proc t)
  (cond
    ((null? t) nil)
    ((not (pair? t)) (proc t))
    (else (cons (other-tree-map proc (car t))
                (other-tree-map proc (cdr t))))))

; The procedure passed to map is a procedure which
; if a number, applies proc to the number
; otherwise, recursively applies the procedure proc to each leaf of the tree

; now map applies the procedure passed to map to each element of the  list 

(define square (lambda (x) (* x x)))

(define (square-tree t)
  (tree-map square t))

(define x (list 1
                (list 2 (list 3 4) 5)
                (list 6 7)))
x
(square-tree x)

