; Exercise 3.2.7
;

#lang racket

; tail-recursive or not
(define factor (lambda (n)
                 (let f ([n n] [i 2] )
                   (cond
                     [(>= i (sqrt n)) (list n)]
                     [(integer? (/ n i)) (cons i (f (/ n i) i))]
                     [else (f n (+ i 1))]))))

(factor 0)
(factor 1)
(factor 12)
(factor 3628800)
(factor 9239)
