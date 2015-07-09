; Exercise 2.57
; sums and products of arbitrary numbers
;

#lang racket

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp) (make-sum (make-product (multiplier exp)
                                                (deriv (multiplicand exp) var))
                                  (make-product (deriv (multiplier exp) var)
                                                (multiplicand exp))))
        ((exponentiation? exp) (make-product (exponent exp)
                                             (make-product (make-exponentiation (base exp) (make-sub (exponent exp) 1))
                                                           (deriv (base exp) var))))
        (else (error "unknow expression type: DERIV" exp))))

(define (variable? x)
  (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? x y)
  (and (number? x) (= x y)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        (else (list '+ a1 a2))))


(define (make-sub s1 s2)
  (cond ((=number? s2 0) s1)
        ((and (number? s1) (number? s2)) (- s1 s2))
        (else (list '- s1 s2))
        ))


(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s)
  (if (> (length s) 3)
      (cons (car s) (cddr s))
      (cadr s)))
; (+ 1 1 1)


(define (augend s)
  (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p)
  (cadr p))

(define (multiplicand s)
  (if (> (length s) 3)
      (cons (car s) (cddr s))
      (cadr s)))
;

(define (exponentiation? exp)
  (and (pair? exp) (eq? (car exp) '**)))

(define (base exp)
  (cadr exp))

(define (exponent exp)
  (caddr exp))

(define (make-exponentiation base expontent)
  (cond ((=number? expontent 0) 1)
        ((=number? base 0) 0)
        ((=number? base 1) 1)
        ((=number? expontent 1) base)
        (else (list '** base expontent))))


; test

; (deriv '(+ x x) 'x)

; (deriv '(* x y) 'x)

; (deriv '(* (* x y) (+ x 3)) 'x)

; (deriv '(** x 12) 'x)

; (deriv '(+ x (** x 12)) 'x)

; (deriv '(+ x x) 'x)

; (deriv '(* x x) 'x)

;
;j(DERIV
;ukuuu'(+ x x y) 'x)

(deriv '(* x x y) 'x)
