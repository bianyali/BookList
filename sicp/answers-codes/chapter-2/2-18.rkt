; Exercise 2-18
; reverse

#lang racket

(define (reverse li)
  (define (recur li pre)
    (if (null? li)
        pre
        (recur (cdr li)
               (cons (car li) pre))))
  (recur li null))

; test
(reverse (list 1 4 9 16 25))
