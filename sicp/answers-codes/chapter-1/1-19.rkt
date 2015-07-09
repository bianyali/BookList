; Exercise 1.19
; A clever algorithm for computing the Fibonacci numbers
; in a logarithmic number of steps
;

#lang racket

(define (fib-iter n)
  (iter n 1 0 0 1))

(define (iter n a b p q)
  (cond ((= n 0) b)
        ((even? n) (iter (/ n 2) a b (+ (* p p) (* q q)) (+ (* 2 (* q p)) (* q q))))
        (else (iter (- n 1) (+ (* b q) (* a q) (* a p)) (+ (* b p) (* a q)) p q))))
