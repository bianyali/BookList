#lang racket

;(raise 12)

;(raise "hello world")



(with-handlers ([exn:fail? (lambda (v) 'oops)])
  (break-thread (current-thread)) ; simulate Ctl-C
  (car 17))
