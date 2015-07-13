#lang racket

#|
  Authro: Yali Bian
  Date: 2015-07-13
  Theme: tspl
|#



(quote (1 2 3 4 5))

(quote ("this" "is" "a" "list"))

(quote (+ 3 4))

(quote (hello world))
(car (quote (hello world)))

'2
'2/3
(quote "Hi Mom!")

(print (car '(a b c)))
(print 'a)
