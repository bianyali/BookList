#lang racket

(define atom? (lambda (x)
                (not (pair? x))))

(atom? null)
(atom? '())
(atom? '(1))
