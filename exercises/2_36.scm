#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; as you keep cdr-ing down each list,
; when you reach the end, accumulate-n
; will take a list of nils as an argument
; now, the car of the sequence will be nil!
; in no other case will the car of the sequence be nil!
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(accumulate-n + 0 s)
