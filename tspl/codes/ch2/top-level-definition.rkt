; Top-level definitions

#lang racket

; double-any
(define double-any (lambda (f x)
                     (f x x)))


(double-any + 10)
(double-any cons 'a)


; showed by let or lambda bindings
(define xyz '(x y z))
(let ([xyz '(z y x)])
  xyz)

; how to define list
(define list (lambda x x))

; cadr, cddr
(define cadr (lambda (x)
               (car (cdr x))))


(define cddr (lambda (x)
               (cdr (cdr x))))

(cadr '(a b c))
(cddr '(a b c))
