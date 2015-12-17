; Section 4.1 Variable references

#lang racket


list

(define x 'a)
(list x x)
(let ([x 'b])
  (list x x))
(let ([let 'let])
  let)

