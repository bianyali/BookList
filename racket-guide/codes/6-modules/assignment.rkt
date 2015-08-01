#lang racket

(module m racket
  (provide counter increment!)
  (define counter 0)
  (define increment! (lambda ()
                       (set! counter (+ 1 counter)))))


(require 'm)

counter

;(set! counter 1)
(increment!)
counter
