(define (subsets s)
  (if (null? s)
    (list nil)
    (let ((rest (subsets (cdr s))))
      (append rest (map (lambda(x) (cons (car s) x)) rest)))))

(display (subsets (list 1 2 3)))

; How does this work?
; If s is the empty list, then it has only one subset: the empty list itself
; otherwise:
; the subsets of the set will consist of subsets which
; a: containt the first element of the set
; b: do not contain the first element of the set
; The subsets which contain the first element can be obtained by adding the first element
; to the subsets which do not contain the first element!
; 1. Base case
; 2. Larger case: smaller case + something extra
; 3. finding subsets of set which contains all but first element of the original set is a smaller problem,
;    would eventually lead to the base case (keep removing an element fro the list)
; rest is a list, and thus mapping that list by adding the first element to each element in rest will produce a list!
