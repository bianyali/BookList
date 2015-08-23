#lang racket

(module m racket
  (provide pie)
  (define pie 3.1416))

(require 'm)

pie

(module m racket
  (provide x)
  (define x 15))

(module m racket
  (provide y)
  (define y 15))
