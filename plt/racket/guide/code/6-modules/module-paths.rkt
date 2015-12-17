#lang racket/main

(module m racket/base
  (provide color)
  (require racket/base)
  (require (lib "racket/base"))
  (define color "blue"))

(module n racket
;;   (require 'm)
  (define color "blue")
   (printf "my favorite color is ~a\n" color))

;(require (lib "n")))

(require "cake.rkt")
(require (lib "racket"))
