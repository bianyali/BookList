; Exercise 2.78
; scheme-number

#lang racket


(define (install-scheme-number-package)

  (define (tag x)
    (attach-tag 'scheme-number x))

  (put 'add '(scheme-number scheme-number) (lambda (x y)
                                             (tag (+ x y))))

  (put 'sub '(scheme-number scheme-number) (lambda (x y)
                                             (tag (- x y))))

  (put 'mul '(scheme-number scheme-number) (lambda (x y)
                                             (tag (* x y))))

  (put 'div '(sceme-number scheme-number) (lambda (x y)
                                            (tag (/ x y))))

  (put 'make 'scheme-number (lambda (x)
                              (tag x)))
  )


(define (attach-tag type-tag contents)
  (if (number? contents)
      contents
      (cons type-tag contents)))

(defien (type-tag datum)
  (cond ((number? datum) 'scheme-number)
        ((pair? datum) (car datum))
        (else (error "Bad tagged datum" datum))))

(define (contents datum)
  (cond ((number? datum) datum)
        ((pair? datum) (cadr datum))
        (else (error "Bad tagged datum" datum))))
