#lang sicp
;(sin 12.15)
;(sin 4.05)
;(sin 1.35)
;(sin 0.44)
;(sin 0.15)
;(sin 0.05)
;6 steps
;No. of steps required
;(+ (GIF (- (log n) (log 0.1))) 1)
;Time complexity is theta(log(n))
;Space complexity is also theta(log(n))- because
;The procedure 'p' will be called theta(log(n)) times, producing
;(p (p (p .. (sin n) ..))) - a chain of as many defered p's as there are number of steps
;Assuming internal stuff is evaluated first