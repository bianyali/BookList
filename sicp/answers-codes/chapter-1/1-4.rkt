; Exercise 1.4
;         Observer that our model of evaluation allows for combinations whose operators are compound expressions.

(define (a-plus-abs-a-b a b)
  ((if (> b 0) + -) a b))

(define (translate a b)
  (if (> b 0)
      (+ a b)
      (- a b)))
