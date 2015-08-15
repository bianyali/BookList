#lang racket

(define save-k #f)

(define save-it! (lambda ()
                   (call-with-composable-continuation (lambda (k)
                                                        (set! save-k k)
                                                        0))))


(+ 1 (+ 1 (+ 1 (save-it!))))

(save-k 5)
(save-k 12)



(define (sum n)
  (if (zero? n)
      (save-it!)
      (+ n (sum (sub1 n)))))

(sum 5)
;(print save-k)
(save-k 1)
