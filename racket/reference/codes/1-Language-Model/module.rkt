#lang racket

(module m racket
  (provide x)
  (define x 10))

(define x -19)

(require (only-in 'm [x m.x]))

x
m.x
