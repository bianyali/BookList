; Exercise 2.8.6
; indirect recursion

#lang racket

(define even? (lambda (x)
                (if (= x 0)
                    #t
                    (odd? (- x 1)))))

(define odd? (lambda (x)
               (if (= x 0)
                   #f
                   (even? (- x 1)))))



(even? 7)
(odd? 7)

(even? 70)
(odd? 70)
