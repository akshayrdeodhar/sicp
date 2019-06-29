(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
	    (cons (square (car things))
		  answer))))
  (iter items nil))

; (square-list (list 1 2 3))
; (iter (list 1 2 3) nil)
; (iter (list 2 3) (list 1))
; (iter (list 3) (list 4 1))
; (iter nil (list 9 4 1))
; (list 9 4 1)

; The successive elements of the input list are prepended rather than appended to the output list

(define (square-list items)
  (define (iter things answer)
     (if (null? things)
       answer
       (iter (cdr things)
	     (cons answer
		   (square (car things))))))
   (iter items nil))

; (square-list (list 1 2 3))
; (iter (list 1 2 3) nil)
; (iter (list 2 3) (cons nil 1))
; (iter (list 3) (cons (cons nil 1) 4))
; (iter nil (cons (cons (cons nil 1) 4) 9))
; (cons (cons (cons nil 1) 4) 9)

; this is not a list!
; The squares become the cdrs of the cons rather the cars
; the first element of this 'list' is another 'list' rather than the first number
