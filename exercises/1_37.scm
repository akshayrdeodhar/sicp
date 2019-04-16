(define (cont-frac n d k)
  (define (recur-cont-frac i)
    (/ (n i)
       (+ (d i)
          (if (> i k)
              0
              (recur-cont-frac (+ i 1))))))
  (recur-cont-frac 1))

(define (icont-frac n d k)
  (define (iter-cont-frac val i)
    (if (= i 0)
        val
        (iter-cont-frac (/ (n i) (+ (d i) val)) (- i 1))))
  (iter-cont-frac 0 k))