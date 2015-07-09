; Exercise 1.12
;

; write a procedure that computes elements of
; Pascal's triangle by means of a recursive process.

#lang racket

(define (pascal-rec x y)
  (if (or (= x 0) (= x y))
      1
      (+ (pascal-rec (- x 1) (- y 1))
         (pascal-rec x (- y 1)))))
