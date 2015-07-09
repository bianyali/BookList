; Exercise 1.42
;

#lang racket

; square
(define (square x)
  (* x x))

; inc
(define (inc x)
  (+ 1 x))

; compose
(define (compose f1 f2)
  (lambda (x)
    (f1 (f2 x))))

((compose square inc)
 6)
