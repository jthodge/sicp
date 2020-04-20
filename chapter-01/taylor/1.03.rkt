#lang racket

(define (find-larger-num x y)
  (if (>= x y) x y))

(define (square x)
  (* x x))

(define (sum-two-largest-squares x y z)
  (if (>= x y)
      (+ (square x) (square (find-larger-num y z)))
      (+ (square y) (square (find-larger-num x z)))))