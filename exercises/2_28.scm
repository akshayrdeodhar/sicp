#lang sicp

; Old solution
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
;

; Naive solution
(define (fringe-rec l)
  (cond ((null? l) l)
        ((not (pair? l)) (list l))
        (else (append (fringe-rec (car l)) (fringe-rec (cdr l))))))

; Some improvement, but still bad
(define (fringe-iter l)
  (define (iter remaining constructed)
    (if (null? remaining)
        constructed
        (iter (cdr remaining) (append constructed (fringe-iter (car remaining))))))
  (cond
    ((null? l) nil)
    ((not (pair? l)) (list l))
    (else (iter l nil))))

(define x (list (list 1 2) (list 3 4) 5 6))
(fringe (list x x))
