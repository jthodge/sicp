#lang racket

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; This procedure accepts two arguments, `a` and `b`, and returns the sum of a
; plus the absolute value of `b`. The procedure determines the absolute value of
; `b` by checking if `b` is greater than 0. If so, the expression `a + b` is
; evalutated. If not, the expression `a - b` is evaluated, ensuring that `b`'s
; value is positive (i.e. `a - (-b)`).