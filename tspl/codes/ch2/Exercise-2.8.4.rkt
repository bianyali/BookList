; Exercise 2.8.4
; list-ref, list-tail

#lang racket

(define list-ref (lambda (li index)
                   (if (= index 0)
                       (car li)
                       (list-ref (cdr li) (- index 1)))))


; test
(define li-1 '(1 2 3 4))
(define li-2 '(a shot (nest) list))


(list-ref li-1 0)
(list-ref li-1 2)
(list-ref li-2 0)
(list-ref li-2 2)


(define list-tail (lambda (li index)
                    (if (= index 0)
                        li
                        (list-tail (cdr li) (- index 1)))))

(list-tail li-1 0)
(list-tail li-1 2)
(list-tail li-2 0)
(list-tail li-2 2)
