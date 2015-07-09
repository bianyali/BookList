; Exercise 2.66
; lookup
;

#lang racket


(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) #f)
        ((= given-key) (key (entity set-of-records))
         (entity set-of-records))
        ((< given-key (key (entity set-of-records))) (lookup given-key (left-branch set-of-records)))
        ((> given-key (key (entity set-of-records))) (lookup given-key (right-branch set-of-records)))))
