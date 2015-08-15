#lang racket

(eval '(+ 1 2))

(define eval-formular (lambda (formula)
                         (eval `(let ([x 2] [y 3])
                                  ,formula))))
(eval-formular '(+ x y))


(eval-formular '(+ (* x y) y))


(define broken-eval-formula (lambda (formula)
                              (let ([x 2] [y 3])
                                (define name (current-namespace))
                                (eval formula (current-namespace)))))

(broken-eval-formula '(+ x y)) ;; error
;(broken-eval-formula '(+ 1 2))
