; Exercise 2.32
; subsets

#lang racket

(define (subsets s)
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
        (display "rest: ")
        (display rest)
        (newline)
        (append rest (map (lambda (sub-rest)
                            (display "sub-rest: ")
                            (display sub-rest)
                            (newline)
                            (append sub-rest (list (car s))))
                          rest)))))

; test
(define s (list 1 2 3))
(subsets s)
