; Exercise 2.2.6


#lang racket

(cons 1
      (cons '(2 . ((3) . ()))
            (cons '(())
                  (cons 4 5))))


;
'(1 (2 . ((3))) (()) 4 . 5)
