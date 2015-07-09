; Exercise 2.27
; deep-reverse
;

#lang racket

(define (deep-reverse tree)
  (define (recur x pre)
    (if (null? x)
        pre
        (recur (cdr x)
               (cons (if (pair? (car x))
                         (recur (car x) null)
                         (car x))
                     pre))))
  (recur tree null))




; test
(define x (list (list 1 2) (list 3 4)))
x
(deep-reverse x)


; (list (list 1 2) (list 3 4))
; (cons (cons 1 (cons 2)) (cons (cons 3 (cons 4)) null))
