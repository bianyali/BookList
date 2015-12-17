#lang r5rs

;set-car!, set-cdr
(define p (list 1 2 3))
p
(set-car! (cdr p) 'two)
p
(set-cdr! p '())
p
