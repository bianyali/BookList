; Exercise 2.8.2

#lang racket

; append
(define append (lambda (li obj)
                 (if (null? li)
                     (list obj)
                     (cons (car li)
                          (append (cdr li) obj)))))

; test
(define li '(1 2 3 4 5 6))
(append li 7)


; append-swiched
(define append-switched (lambda (li obj)
                 (if (null? li)
                     (list obj)
                     (cons (append-switched (cdr li) obj)
                           (car li)
                           ))))

(append-switched li 7)
