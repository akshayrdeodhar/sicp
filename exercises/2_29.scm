(define (make-mobile left right)
  (list left right))
; alternaltely,
; (define make-mobile cons)

(define (make-branch length structure)
  (list length structure))
; same here- (define make-branch cons) also possible

(define left-branch car)
(define right-branch cadr)
; if cons, (define right-branch cdr)

(define branch-length car)
(define branch-structure cadr)
; if cons, (define branch-structure cdr)

; I don't feel like using pair? in code about mobiles
(define (is-mobile structure)
  (pair? structure))


(define (total-weight mobile)
  (if (is-mobile mobile)
    (+ (total-weight (branch-structure (left-branch mobile))) (total-weight (branch-structure (right-branch mobile))))
    mobile))
; changing the representation would not need change in total-weight

(define (balanced mobile)
  (define (torque branch)
    (* (branch-length branch) (total-weight (branch-structure branch))))
  (if (is-mobile mobile)
      (and (= (torque (left-branch mobile)) (torque (right-branch mobile)))
           (balanced (branch-structure (left-branch mobile)))
           (balanced (branch-structure (right-branch mobile))))
      #t))
; changing representation will not affect balanced

(define a (make-branch 10 10))
(define b (make-branch 10 10))

(define mob (make-mobile a b))

(define c (make-branch 5 20))
(define d (make-branch 5 mob))

(define mobi (make-mobile c d))

;         mobi
;    c         d
;   mob
; a     b

(total-weight mobi)
(balanced mobi)