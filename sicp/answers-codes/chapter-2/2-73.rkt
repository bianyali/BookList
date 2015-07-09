; Exercise 2.73
; data-directed differentiation

#lang racket


(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable exp var)
                             1
                             0))
        (else ((get 'deriv (operator exp)) (operand exp) var))))

(define (operator exp)
  (car exp))

(define (operands exp)
  (cdr exp))

(define (install-sum-package)
  ;; internal procedures
  (define (dif seq)
    (let ((left-deriv (deriv (car seq)))
          (right-deriv (deriv (cadr seq))))
      (cond ((= left-deriv 0) right-deriv)
            ((= right-deriv 0) left-deriv)
            ((and (number? left-deriv) (number? right-deriv)) (+ left-deriv right-deriv))
            (else (list '+ left-deriv right-deriv)))))



  ;; interface to the rest of the system
  (put 'deriv '+ dif)
  'done)

(define (install-product-package)
  ;; internal procedure
  (define (dif seq)
    (let ((left-deriv (deriv (car seq)))
          (right-deriv (deriv (cadr seq))))
      (cond ((or (= left-deriv 0)
                 (= right-deriv 0)) 0)
            ((= left-deriv 1) right-deriv)
            ((= right-deriv 1) left-deriv)
            ((and (number? left-deriv) (number? right-deriv)) (* left-deriv right-deriv))
            (else (list '* left-deriv right-deriv)))))

  ; interface to the reset of the system
  (put 'deriv '* dif)
  'done)

(define (make-product m1 m2)
  (cond ((or (= m1 0) (= m2)) 0)
        ((= m1 1) m2)
        ((= m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
