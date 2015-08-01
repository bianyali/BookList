#lang racket

(module m racket
  (define x 10))


(module test racket
  (require 'm)
  (display x))
