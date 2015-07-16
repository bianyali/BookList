; Exercise 2.8.3

#lang racket

;make-list
(define make-list (lambda (n obj)
                    (if (= n 0)
                        '()
                        (cons obj
                              (make-list (- n 1) obj)))))

(make-list 7 '())
