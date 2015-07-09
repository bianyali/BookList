; Exercise 2.54
; equal?
;

#lang racket

(define (equal? sq1 sq2)
  (cond ((and (null? sq1) (null? sq2)) #t)
        ((or (null? sq1) (null? sq2)) #f)
        ((and (pair? sq1) (pair? sq2)) (if (eq? (car sq1) (car sq2))
                                                       (equal? (cdr sq1) (cdr sq2))
                                                       #f))
        ((and (not (pair? sq1)) (not (pair? sq2))) (eq? sq1 sq2))

        (else #f)))

; test
(equal? 'a 'a)
(equal? 'a 'b)
(equal? 'a '(a b))
(equal? '(a b) '(c d))
(equal? '(a b) '(a c))
(equal? '(a b) '(a b))
(equal? '(a b) '(a b c))
