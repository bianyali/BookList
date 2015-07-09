; Exercise 1.17
; The exponentiation algorithms
; perform integer multiplication by means of repearted addition

#lang racket
(define (fast-mult-recur a b)
  (cond
   ((= b 0) 0)
   ((even? b) (* 2 (fast-mult-recur a (/ b 2))))
   (else (+ a (fast-mult-recur a (- b 1))))))
