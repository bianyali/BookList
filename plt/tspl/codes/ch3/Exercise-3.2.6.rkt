; Exercise 3.2.6
;

#lang racket


(define-syntax or-true
  (syntax-rules ()
    [(_) #f]
    [(_ e) e]
    [(_ e1 e2 e3 ...)
     (let ([t e1])
       (if t t (or e2 e3 ...)))]))

(define-syntax or-false ; incorrect!
  (syntax-rules ()
    [(_) #f]
    [(_ e1 e2 ...)
     (let ([t e1])
       (if t t (or e2 ...)))]))
; it can only return #f not


(or-true)
(or-false)
(or-true (= 1 12))
(or-false (= 1 12))
(or-false 'f)
(or-true 'true 'false)
(or-false 'true 'false)
(or-true '1 '2 '3)
(or-false '1 '2 '3)
