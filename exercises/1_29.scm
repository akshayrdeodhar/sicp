(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (term i n)
    (cond
      ((or (= i n) (= i 0)) (f (+ a (* i h))))
      ((= (remainder i 2) 0) (* 2 (f (+ a (* i h)))))
      ((= (remainder i 2) 1) (* 4 (f (+ a (* i h)))))))
  (define (iter i sum n)
    (if (> i n)
        sum
        (iter (+ i 1) (+ sum (term i n)) n)))
  (* (iter 0 0 n) (/ h 3)))

(define (sigma term a next b)
  (if (> a b)
      0
      (+ (term a) (sigma term (next a) next b))))

(define (integrate f a b dx)
  (define (add-dx x)
    (+ x dx))
  (*
   (sigma f (+ a (/ dx 2)) add-dx b)
   dx))

; Simpson works better for same number of steps for cube
; However, normal integration works better for sin! (same number of steps)
