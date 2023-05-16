; Addition and Subtraction

; The interval obtained by addition of two intervals is
(make-interval (+ (lower-bound a) (lower-bound b))
               (+ (upper-bound a) (upper-bound b)))

; i.e
; let am be mean of upper and lower bounds of a, and bm of b
;so, sum is equivalent to
; similarly, wa and wb be the widths
(make-interval (+ (- am wa) (- bm wb))
               (+ (+ am wa) (+ bm wb)))

; The width of this is therefore
(/
 (- (+ (+ am wa) (+ bm wb))
    (+ (- am wa) (- bm wb)))
 2)

; which is

(/
 (- (+ (+ am bm) (+ wa wb))
    (- (+ am bm) (+ wa wb)))
 2)

; i.e

(/
 (* 2 (+ wa wb))
 2)
;i.e

(+ wa wb)

; which is a function of only widths of a and b.

; The width is same for subtraction-
; (upper bound subtracted from lower bound gives (- (- ma mb) (+ wa wb))) and so on

;Now for multiplication
; For disproving, we only need to disprove for one case
; Consider two intervals having both upper and lower bounds positive
; Thus, the interval obtained my multiplying them will have
; upper bound as product of their upper bounds
; lower bound as product of their lower bounds

(make-interval   (* (lower-bound a) (lower-bound b))
                 (* (upper-bound a) (upper-bound b)))

(make-interval (* (+ am wa) (+ bm wb))
               (* (- am wa) (- bm wb)))

(make-interval (+ (* am bm) (* am wb) (* bm wa) (* wa wb))
               (+ (* am bm) (- (* am wb)) (- (* bm wa)) (* wa wb)))

; so, width of the interval is

(/
 (- (+ (* am bm) (* am wb) (* bm wa) (* wa wb))
    (+ (* am bm) (- (* am wb)) (- (* bm wa)) (* wa wb)))
 2)

; i.e

(/
 (* 2
    (+ (* am wb)
       (* bm wa)))
 2)

; which is

(+ (* am wb) (* bm wa))

; which not a function of only widths.

; in other words, if am was am' not equal to am and / or bm was bm' not equal to bm
; the width of the resultant interval would be different.