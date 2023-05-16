(define (cont-frac n d k)
  (define (iter-cont-frac val i)
    (if (= i 0)
        val
        (iter-cont-frac (/ (n i) (+ (d i) val)) (- i 1))))
  (iter-cont-frac 0 k))

(define (tan-cf x k)
  (let ((nxsq (- (* x x))))
    (define (n i)
      nxsq)
    (define (d i)
      (- (* 2 i) 1))
    (/ (cont-frac n d k) (- x))))

(define pi
  (* 2 (asin 1)))