#lang racket

(require bialy/hello)

(hello)


(module hi racket
  (printf "Hello\n"))


(module cake-2 racket

  (module cake-1 racket
    (define x 5)
    (println "In cake-1"))
  (require 'cake-1)
  (println "In cake-2"))


(require 'cake-2)
;; (require 'hi)

;; (require 'hi)
