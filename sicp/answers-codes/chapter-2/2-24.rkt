; Exercise 2.24
; tree
;

#lang racket

(list 1 (list 2 (list 3 4)))

(cons 1 (cons (cons 2 (cons (cons 3 (cons 4 null)) null)) null))
;(cons 1 (cons 2 (cons (cons 3 4) null)))

(cons '() null)

(cons 1 (cons 2 3))
