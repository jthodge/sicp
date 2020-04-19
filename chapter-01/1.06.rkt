#lang racket

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; Attempting to compute square roots using this updated, non-special-form `if`
; procedure will cause an infinite loop, because `sqrt-iter` will always attempt
; to evaluate itself in its interior alternative case, instead of terminating
; when `good-enough?` is true.