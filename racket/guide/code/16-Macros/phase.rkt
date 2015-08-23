#lang racket

;(define-syntax x (lambda (y) #'()))

(define age 1)

(begin-for-syntax
  (define age 2))

;; (eval (with-syntax ([age #'age])
;;         #'(display age)))

;; (eval (with-syntax ([age #'age])
;;         #'(begin-for-syntax
;;             (displayln age))))

(begin-for-syntax
  (displayln age))






(module a racket
  (define button 0)
  (provide (for-syntax see-button))
  (define-for-syntax see-button #'button))

(module b racket
  (require 'a)
  (define button 8)
  (define-syntax (m stx)
    see-button)
  (m))

(require 'b)
