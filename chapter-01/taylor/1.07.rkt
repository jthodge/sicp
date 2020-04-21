#lang racket

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; The `good-enough?` conditional test using the predetermined tolerance of 0.001
; will not be effective for finding the square roots of very small numbers
; because the approximation may terminate too early, leading to a result that is
; significantly too large.

(sqrt 0.00000000000000000001337)
; 0.03125
; correct square root == 1.1562872e-10

(square 0.03125)
; 0.0009765625

; For very large numbers, the predetermined tolerance of 0.001 will not be
; effective because any given machine's floating point precision makes it
; unable to represent small differences between necessarily large numbers.
;
; This inability is revealed by the `(< (abs (- (square guess) x)) 0.001)`
; expression in the `good-enough?` procedure. If the result of `square guess`
; is not within 0.001 of the radicand, then the final result of the expression
; returns `#f`. This causes the alternative `sqrt-iter` procedure to run in a
; recursive loop.

; (sqrt 99999999999999999)
; recursive loop

; A better strategy for finding square roots directly determines whether or not
; the current guess and the next guess are equal, instead of within a given
; tolerance.

(define (good-enough? guess x)
  (= (improve guess x) guess))

(sqrt 0.00000000000000000001337)
; 1.1562871615649808e-10

; This still doesn't handle large numbers very well, though...

(sqrt 99999999999999999)
; 316227766.01683795

(square 316227766.01683795)
; 1.0000000000000002e+17