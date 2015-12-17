; Sequencing - special form: begin
;

#lang racket


(define display-seq (lambda (arg1 arg2 arg3)
                   (begin
                     [display arg1]
                     [display " "]
                     [display arg2]
                     [display " "]
                     [display arg3]
                     [newline])))


"------display-seq------"
(display-seq "1" "2" "3")



(define display-con (lambda (arg1 arg2 arg3)
                      ((lambda (x1 x2 x3)
                         (newline)) (display arg1) (display arg2) (display arg3))))

"------display-con------"
(display-con " 1 " " 2 " " 3 ")
