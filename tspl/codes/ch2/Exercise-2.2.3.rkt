;Exercise 2.2.3

#lang racket

; a.
; '(car . cdr)
(cons 'car 'cdr)

; b.
; '(this (is silly))
(list 'this '(is silly))

; c.
; '(is this silly?)
(cons 'is '(this silly?))

; d.
; '(+ 2 3)
(quote (+ 2 3))

; e.
; '(+ 2 3)
(cons '+ '(2 3))

; f.
; '+
(car '(+ 2 3))

; g.
; (2 3)
(cdr '(+ 2 3))

; h.
; <procedure:cons>
cons

; i.
; 'cons
(quote cons)

; j.
; ''cons in Racket lang
; '(quote cons) in common
(quote (quote cons))

; k.
; quote
(car (quote (quote cons)))

; l.
; 5
(+ 2 3)

; m.
; 5
(+ '2 '3)


; n.
; 5
(+ (car '(2 3))
   (car (cdr '(2 3))))

; o.
; 5
((car (list + - * /)) 2 3)
