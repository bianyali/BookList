#lang racket

(module m racket
  (provide rx:fish fishy-string?)
  (define rx:fish #rx"fish")
  (define fish-string? (lambda (s)
                         (set! rx:fish #rx"fish")
                         (regexp-match s rx:fish))))

(require 'm)

(define rx:fish 12)
