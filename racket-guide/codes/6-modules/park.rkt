#lang racket

(module zoo racket
  (provide tiger)
  (define tiger "Tony"))

(require 'zoo)
;tiger

;"-------------------------"
;(require "cake.rkt")

;"-------------------------"


(module m (lib "racket")
  (provide v1 v2)
  (define v1 "v1")
  (define v2 "v2"))


;(require (only-in 'm v2 v1))

(require (only-in 'm [v1 v2] [v2 v1]))
v1
v2
