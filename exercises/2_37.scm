#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define mat (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

; won't work -> the "map" function in this environment
; does not operate on multiple sequences
;(dot-product mat mat)

; each *row* (that is list within list) is mapped
; to its dot product with the vector v
(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(transpose mat)

; P = A * B
; P(i, j) = A(i, *) * B(*, j)
; P(i, *) = [A(i, *) * B(*, 0), A(i, *) * B(*, 1), ... A(i, *) * B(*, k)]
;         = [BT(0, *) * A(i, *), BT(1, *) * A(i, *), ... BT(k, *) * A(i, *)]
;         = BT * A(i, *) !
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))ag