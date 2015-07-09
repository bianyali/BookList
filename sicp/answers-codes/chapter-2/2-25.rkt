; Exercise 2.25
;

#lang racket


; do not forget the null in every list.

(car (cdr (car (cdr (cdr (list 1 3 (list 5 7) 9))))))

(car (car (list (list 7))))

(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))))) ))))))))
;car cdr car cdr car cdr
