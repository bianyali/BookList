#lang racket

(define-syntax-rule (swap x y)
  (let ([tmp x])
    (set! x y)
    (set! y tmp)))


(define x 12)
(define y 32)
(swap x y)
x
y

;(swap 12 32)


(let ([tmp 4] [other 6])
  (swap tmp other)
  (println tmp)
  (println other))


(let ([set! 5] [other 6])
  (swap set! other)
  (list set! other))



(define rotate
  (syntax-rules ()
    [(rotate a b) (swap a b)]))

;; (let ([(a 5) (b 6)])
;;   (x-1 a b)
;;   a
;;   b)

;; (rotate x y)
;; x
;; y

(rotate '('x 'y))

;(syntax-rules 12)

(define-syntax fack (lambda ()
                      '(+ 1 2 3)))

;(fack)
;fack
