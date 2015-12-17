; Exercise 2.5.1
; determine the values of the expressions below

#lang racket/base

; a.
; 'a
(let ([f (lambda (x) x)])
  (f 'a))

; b.
; '(a)
(let ([f (lambda x x)])
  (f 'a))

; c.
; 'a
(let ([f (lambda (x . y)
           x)])
  (f 'a))

; d.
; '()
(let ([f (lambda (x . y) y)])
  (f 'a))
