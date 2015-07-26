; Section 6.3. Lists and Pairs

#lang racket


(let ([x (list 'a 'b 'c)])
  (set-cdr! (cddr x) x)
;  (list? x)
;  x
  (length x))

