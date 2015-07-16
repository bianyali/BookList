; Exercise 2.8.7
; transpose

#lang racket

(define transpose
  (lambda (li)
    (cons
     (map (lambda (x)
            (car x))
          li)
     (map (lambda (x)
            (cdr x))
          li))))


; test
(define li '((a . 1) (b . 2) (c . 3)))

(transpose li)
