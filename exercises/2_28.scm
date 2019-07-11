(define (fringe t)
  (define (fringe-state t constructed)
    (cond
      ((null? t) constructed)
      ((not (pair? t)) (append constructed (cons t nil)))
      (else (append constructed (append (fringe (car t)) (fringe (cdr t)))))))
  (fringe-state t nil))

;Lesson: append takes two lists as an argument
; A list is:
; a. nil
; (cons <something> list)
; Haha

(define x (list (list 1 2) (list 3 4) 5 6))
(fringe (list x x))

