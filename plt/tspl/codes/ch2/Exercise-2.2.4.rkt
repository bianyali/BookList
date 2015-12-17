; Exercise 2.2.4

#lang racket

; a
(car (car '((a b) (c d))))

; b
(car (cdr (car '((a b) (c d)))))

; c
(car (car (cdr '((a b) (c d)))))

; d
(car (cdr (car (cdr '((a b) (c d))))))
