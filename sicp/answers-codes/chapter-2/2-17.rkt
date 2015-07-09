; Exercise 2.17
; last-pair

#lang racket

(define (last-pair li)
  (if (null? (cdr li))
      (car li)
      (last-pair (cdr li))))

; test
(last-pair (list 23 72 149 34))
