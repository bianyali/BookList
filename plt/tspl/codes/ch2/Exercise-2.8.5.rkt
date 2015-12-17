; Exercise 2.8.5
; Shorter

#lang racket

; shorter
(define shorter? (lambda (li-1 li-2)
                  (cond
                    [(null? li-1) #t]
                    [(null? li-2) #f]
                    [else (shorter? (cdr li-1) (cdr li-2))])))

(define shorter (lambda (li-1 li-2)
                  (if (shorter? li-1 li-2)
                      li-1
                      li-2)))


(shorter '(a b c) '(a b c d))
(shorter '(a b c) '(b c d))
(shorter '(a b c) '(a b))
