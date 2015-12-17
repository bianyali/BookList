; Section 4.5. Multiple Values


#lang racket


(let-values ([(a b) (values 1 2)] [(c d e) (values 1 2 3)])
  (list a b c))
