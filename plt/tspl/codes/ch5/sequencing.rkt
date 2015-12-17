; Section 5.2. Sequencing

#lang racket

(begin
  [define x 'x]
  [define y (lambda () 'y)])

x
y



; in let field
(let ()
  (begin
    [define z 'z]
    [define m (lambda () 'm)]
    z
    m))

;z
;m
