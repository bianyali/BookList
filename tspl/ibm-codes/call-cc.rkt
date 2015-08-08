#lang racket

(call/cc (lambda (return)
           (for-each (lambda (x)
                       (when (< x 0)
                         (return x)))
                     '(99 88 77 66 55))
           #t))


(call/cc (lambda (return)
           (for-each (lambda (x)
                       (when (< x 0)
                         (return x)))
                     '(99 88 -77 66 55))
           #t))


(define foo #f)
(call/cc
 (lambda (bar)
   (set! foo bar)
   123))

(foo +)
foo
