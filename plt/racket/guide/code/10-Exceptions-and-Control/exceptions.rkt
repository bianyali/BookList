#lang racket

;(/ 1 0)


;(car 18)


(with-handlers ([exn:fail:contract:divide-by-zero? (lambda (exn)
                                                    +inf.0)])
  (/ 1 0))

(newline)

(with-handlers ([exn:fail? (lambda (exn)
                             +inf.0)])
  (car 18))

(newline)

(with-handlers ([exn:fail? (lambda (exn)
                             'air-bag)])
  (error "crash!"))


;(raise 2)
;(raise "hello world!")


;(display (error "Crash!"))

(newline)
(with-handlers ([(lambda (v)
                  (equal? v 2))
                 (lambda (v)
                   'two)])
  (raise 2))

(newline)

(with-handlers ([(lambda (v)
                  (equal? v 2))
                 (lambda (v)
                   'two)])
  (raise (+ 1 1)))

(define (always-fail n)
  (with-handlers ([even? (lambda (v)
                           'even)]
                  [positive? (lambda (v)
                               'positive)])
    (raise n)))

(always-fail 1)
(always-fail 2)
(always-fail -2)
(always-fail -1)
(always-fail "rocking the Racket")
