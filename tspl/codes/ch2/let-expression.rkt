; Variable and Let expression

#lang racket

(let ([x 2])
  (+ x 3))


(let ([y 3])
  (+ 2 y))

(let ([x 2] [y 3])
  (+ x y))

(let ([f +])
  (f 2 3))

(let ([f +] [x 2])
  (f x 3))


(let ([f +] [x 2] [y 3])
  (f x y))


(let ([+ *])
  (+ 2 3))



; nest let
(let ([a 4] [b -3])
  (let ([a-squared (* a a)]
        [b-squared (* b b)])
    (+ a-squared b-squared)))


(let ([x 1])
  (let ([x (+ x 1)])
    (+ x x)))


(let ([x 1])
  (let ([new-x (+ x 1)])
    (+ new-x new-x)))
