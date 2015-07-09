; Exercise 1.7:
; Refine the good-enough? procedure
;
;#lang racket

(define (sqrt-iter guess x)
  (if (good-engough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-engough? old-guess new-guess)
  (> 0.01
     (/ (abs (- new-guess old-guess))
        old-guess)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x1 x2)
  (/ (+ x1 x2) 2))


(define (sqrt-kook x)
  (sqrt-iter 1.0 x))
