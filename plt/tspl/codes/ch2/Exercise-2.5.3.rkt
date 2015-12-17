; Exercise 2.5.3
; List the variables that occur free in each of the lambda expresson
; Do not omit variables that name primitive procedures such as + or cons

#lang racket/base

#|
; a.
; null
(lambda (f x) (f x))

; b.
; +
(lambda (x) (+ x x))

; c.
; f
(lambda (x y)
  (f x y))

; d.
; cons, f, y
(lambda (x)
  (cons x (f x y)))

; e.
; let, cons, y
(lambda (x)
  (let ([z (cons x y)])
    (x y z)))

; f.
; y, cons, let
(lambda (x)
  (let ([y (cons x y)])
    (x y z)))

|#
