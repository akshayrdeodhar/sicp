(define (cont-frac n d k)
  (define (iter-cont-frac val i)
    (if (= i 0)
        val
        (iter-cont-frac (/ (n i) (+ (d i) val)) (- i 1))))
  (iter-cont-frac 0 k))

(define (d i)
  (let
      ((mod (remainder (- i 1) 3))
       (n (quotient (- i 1) 3)))
    (cond
      ((= i 1) 1)
      ((= mod 1) (* 2 (+ n 1)))
      (else 1))))

(define (n i)
  1)

(define euler
  (+ 2 (cont-frac n d 1000)))

(define (iter i n)
  (display (d i))
  (newline)
  (if (> i n)
      0
      (iter (+ i 1) n)))

    