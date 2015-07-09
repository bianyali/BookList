; Exercise 2.55
; interptrter the expression
;

#lang racket


(car ''abra)

(car (quote (quote abra)))

(car '(quote abra))
