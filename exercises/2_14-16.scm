; 2_14
; Dividing interval a by itself does not yield a 1.
; In fact, dividing (make-center-percent 100 1) by itself yields a percentage error of almost 2
; However, the actual range of values will range from 101 / 99 and 99 / 101 has percentage deviation from center 1.5
; This is because direct division which divides upper bound of dividend by lower bound of divisor does not occur.
; Instead, 1 / (lower-bound b) and the product of result with (upper-bound a) is done seperately
; I do not know whether this is the answer the book expect, but want to move on to the interesting part in 2.2

; 2_15
; Because R can take only *one* value in it's interval at a time.
; However, the error gets accounted for multiple times if the same symbol is used in an expression multiple times
; So, an expression which uses the symbol once is more 'accurate'

; 2_16
; pass