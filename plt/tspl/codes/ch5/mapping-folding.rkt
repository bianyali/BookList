; Section 5.5. Mapping and Folding

#lang racket

(map abs '(1 -2 3 -4 5 -6))

(map (lambda (x y)
       (* x y))
     '(1 2 3 4 5)
     '(1 2 3 4 5))

#|
(map (lambda (x y)
       (* x y))
     '(1 2 3 4)
     '(1 2 3 4 5))

|#


(map + '())


(for-all symblol? '(a b c d))
