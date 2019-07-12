(define (square-tree t)
  (cond
    ((null? t) nil)
    ((not (pair? t)) (* t t))
    (else (cons (square-tree (car t))
		(square-tree (cdr t))))))

(define (mapped-square-tree t)
  (map (lambda(t)
	 (if (pair? t)
	   (mapped-square-tree t)
	   (* t t)))
       t))

(define x (list 1
		(list 2 (list 3 4) 5)
		(list 6 7)))

x
(square-tree x)
(mapped-square-tree x)
