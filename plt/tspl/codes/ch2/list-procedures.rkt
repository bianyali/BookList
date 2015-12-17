#lang racket

(car '(a b c))
(cdr '(a b c))

(car (cdr '(a b c)))
(cdr (cdr '(a b c)))

(car '((a b) (c d)))
(cdr '((a b) (c d)))


(cons 'a '())
(cons 'a '(b c))
(cons 'a (cons 'b (cons 'c '())))

(car (cons 'a '(b c)))
(cdr (cons 'a '(b c)))
(cons (car '(a b c))
      (cdr '(d e f)))
(cons (car '(a b c))
      (cdr '(a b c)))
