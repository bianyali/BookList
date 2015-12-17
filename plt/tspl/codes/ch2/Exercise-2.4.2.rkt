; Exercise 2.4.2
; detemine value of the expression

#lang racket

; 3 + 3 == 6
; 6 * 9 == 54
(let ([x 9])
  (* x
     (let ([x (/ x 3)])
       (+ x x))))
