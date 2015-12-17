#lang racket


(module m racket
  (define y 12)
  (println "in cake-m"))
(require 'm)


(println "in cake")
(define x (box 2))

(provide x)
