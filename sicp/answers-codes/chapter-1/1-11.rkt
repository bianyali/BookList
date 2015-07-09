; Exercise 1.11

#lang racket

; a procedure that computes f by means of a recursive process
(define (f-recursive n)
  (if (< n 3)
      n
      (+ (* 1 (f-recursive (- n 1)))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))


; a procedure that computers f by means of an iterative process
(define (f-iter n)
  (if (< n 3)
      n
      (iter n 2 1 0)))

; a is f(n-1)
; b is f(n-2)
; c is f(n-3)
(define (iter n a b c)
  (if (< n 3)
      a
      (iter (- n 1) (+ a (* b 2) (* c 3)) a b)))
