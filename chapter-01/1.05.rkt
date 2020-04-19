#lang racket

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; With an interpreter using applicative-order evaluation, one would observe an
; infinite loop, because the interpreter evaluates the interior procedure `(p)`
; (in `(test 0 (p)))`) first. The procedure `(p)` would attempt to recursively
; call itself without terminating.
;
; With an interpreter using normal-order evaluation, one would observe the
; procedure return the value `0`, because the interpreter evaluates the `test`
; procedure first. And because the value of x is 0, the `if` condition's
; predicate is `true` (or I suppose `#t`), and the `0` consequent is returned.