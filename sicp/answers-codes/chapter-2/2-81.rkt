; Exercise 2-81
;

#lang racket

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply pro (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (if (eq? type1 type2)
                    (error? "No method for these types" (list op type-tags))
                    (let ((t1->t2 (get-coercion type1 type2)) ; step - 1
                          (t2->t1 (get-coercion type2 type1)))
                      (cond (t1->t2 (applay-generic op (t1->t2 a1) a2)) ; step - 2
                            (t2->t1 (applay-generic op a1 (t2->t1 a2)))
                            (else (error "No method for these types" (list op type-tags)))))))
              (error "No method for these types" (list op type-tags)))))))


(define (scheme-number->scheme-number n)
  n)

(define (complex->complex z)
  z)

(put-coercion 'scheme-number 'scheme-number scheme-number->scheme-number)

(put-coercion 'complex 'complex complex->complex)

(define (exp x y)
  (apply-generic 'exp x y))

(put 'exp '(scheme-number scheme-number)
     (lambda (x y)
       (tag (expt x y))))

; (exp z1 z2)
; step 1 - 2 - 1 - 2

; no
; it's a dead loop
