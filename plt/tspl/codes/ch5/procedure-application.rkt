; Section 5.1. Procedure Application

#lang racket


(apply + '(4 5))
(apply + 4 5 '())
(apply + 4 5 null)
(apply + 4 5 '(0))
; (apply + 1 2) ; error!!! no list

(append '(1 2 3) 1)
; (append '(1 2 3) 1 2) ; error!!!
(append '(1 2 3) '(4 5 6) '(7 8 9))
;(apply append '(1 2 3) '(7 8 9)) ; error!!! can not append atoms to list
(apply append '(1 2 3) '((4 5 6)(7 8 9)))
