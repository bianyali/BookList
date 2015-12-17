#lang racket

(syntax->datum
 (syntax-case #'(+ 1 2) ()
              [(op n1 n2) #'(= n1 n2)]))


(syntax-case #'(+ 1 2) ()
              [(op n1 n2) #'(= n1 n2)])

(define-syntax (swap stx)
  (syntax-case stx ()
    [(swap x y) #'(let ([tmp x])
                    (set! x y)
                    (set! y tmp))]))
