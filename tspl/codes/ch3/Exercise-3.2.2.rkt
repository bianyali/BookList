; Exercise 3.2.2
;

#lang racket


(define factor-letrec (lambda (n)
                        (letrec ([f (lambda (n i)
                                       (cond
                                         [(>= i n) (list n)]
                                         [(integer? (/ n i))
                                          (cons i (f (/ n i) i))]
                                         [else (f n (+ i 1))]))])
                                 (f n 2))))

(factor-letrec 0)
(factor-letrec 1)
(factor-letrec 12)
(factor-letrec 3628800)
(factor-letrec 9239)

#|

I prefer the factor procedure, since its more simple and codes-save.

|#
