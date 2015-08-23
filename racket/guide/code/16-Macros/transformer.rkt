#lang racket

(syntax-rules ()
  [(nothing) something])


(syntax-e #'(+ 1 2))

(syntax->datum #'(+ 1 2))


(newline)
(newline)
(newline)
(syntax-e #'(+ 1 2))
"--------------------"
(newline)

(syntax->datum (car (syntax-e #'(+ 1 2))))

;#'(+ 1 2)

"--------------------"
(newline)
(define-syntax self-as-string (lambda (stx)
                                (display "hello")
                                (display stx)
                                (datum->syntax stx
                                               (format "~s" (syntax->datum stx)))))

(self-as-string (+ 1 2))

;; (self-as-string (datum->syntax (+ 1 2)))

;; (define self-string (lambda (stx)
;;                       (datum->syntax stx

;;                                      (format "~s" (syntax->datum stx)))))

;; (syntax->datum (self-string (datum->syntax (+ 1 2))))

self-as-string
