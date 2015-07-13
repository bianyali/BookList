; Exercise 2.2.7

#lang racket




(car '((a b) (c d)))
; a
(car (car '((a b) (c d))))


; b
(car (cdr (car '((a b) (c d)))))
(cdr (car '((a b) (c d))))
(cdr (cdr (car '((a b) (c d)))))

; c
(car (car (cdr '((a b) (c d)))))
(car (cdr '((a b) (c d))))

; d
(car (cdr (car (cdr '((a b) (c d))))))
(cdr (car (cdr '((a b) (c d)))))
(cdr (cdr (car (cdr '((a b) (c d))))))
