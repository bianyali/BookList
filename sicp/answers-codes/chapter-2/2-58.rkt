; Exercise 2.58
; differentiate algebraic expressions presented in infix form
;

; if has +, it's a + , if not , if't a *


#lang racket

(define (deriv exp-with-parentheses var)
  (let ((exp (delete-parentheses exp-with-parentheses)))
    (delete-parentheses
    (cond ((number? exp) 0)
          ((variable? exp) (if (same-variable? exp var) 1 0))
          ((sum? exp) (make-sum (deriv (addend exp) var)
                                (deriv (augend exp) var)))
          ((product? exp) (make-sum (make-product (multiplier exp)
                                                  (deriv (multiplicand exp) var))
                                    (make-product (deriv (multiplier exp) var)
                                                  (multiplicand exp))))
          (else (error "unknow expression type: DERIV" exp))))))

(define (delete-parentheses exp)
  (if (and (pair? exp) (= 1 (length exp)))
      (car exp)
      exp))

(define (variable? x)
  (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? x y)
  (and (number? x) (= x y)))

(define (make-sum a1 a2)
  ;(display "in make-sum")
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        (else (list a1 '+ a2))))


(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

(define (sum? x)
  (if (> (length x) 1)
      (if (same-variable? '+ (cadr x))
          #t
          (sum? (cddr x)))
      #f))

(define (addend s)
  (if (eq? (cadr s) '+)
      (cons (car s) null)
      (cons (car s) (cons (cadr s) (addend (cddr s))))))

(define (augend s)
  (if (eq? (cadr s) '+)
      (cddr s)
      (augend (cddr s))))

(define (product? x)
  (if (> (length x) 1)
      (if (eq? '* (cadr x))
          #t
          (product? (cddr x)))
      #f
      ))

(define (multiplier s)
  (if (eq? (cadr s) '*)
      (cons (car s) null)
      (cons (car s) (cons (cadr s) (multiplier (cddr s))))))

(define (multiplicand s)
  (if (eq? (cadr s) '*)
      (cddr s)
      (multiplicand (cddr s))))


; test

(deriv '(x + (3 * (x + (y + 2)))) 'x)
(deriv '(x + (3 * (x + (y + 2))) * x) 'x)
