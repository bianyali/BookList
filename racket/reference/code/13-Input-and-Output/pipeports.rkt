#lang racket

(define-values (in out) (make-pipe))
(write "hello" out)
(write "world" out)
;(pipe-content-length out)
(pipe-content-length in)
(read in)
(read in)

(pipe-content-length out)
