; Exercise 2.23
; for-each
;

#lang racket

(define (for-each f x)
  (define (iter x)
    (when (not (null? x))
      (f (car x))
      (iter (cdr x))))
  (iter x))

(for-each (lambda (x)
            (display x))
          (list 1 2 3 4 5 6))
