#lang racket

(define (cubert-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubert-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (good-enough? guess x)
  (= (improve guess x) guess))

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (cubert x)
  (cubert-iter 1.0 x))