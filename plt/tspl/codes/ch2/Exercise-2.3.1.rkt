; Exercise 2.3.1
;

#lang racket




; 不分顺序的求：
; 1. (car (cdr (list + - * /)))
; 1.1 (cdr (list + - * /))
; 1.1.1 list -> procedure
; 1.1.2 + -> procedure
; 1.1.3 - -> procedure
; 1.1.4 * -> procedure
; 1.1.5 / -> procedure
; 1.1 -> (cdr '(+ - * /))
; 1 -> (car '(- * /))
; -> -
; 2. 17 - 17
; 3. 5 - 5

; -> 12
((car (cdr (list + - * /))) 17 5)
