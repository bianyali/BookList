#lang racket

(struct posn
  (x y))

(write (posn 1 2))

(define-values (in out) (make-pipe))

(write (posn 1 2) out)
(read in)
