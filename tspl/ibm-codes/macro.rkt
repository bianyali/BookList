#lang racket


(define-syntax hello
  (syntax-rules ()
    [(_)
     "hi"]
    [(_ sum ...)
     "hello world"]))

(hello)

;hello

#|
hehhe
|#
