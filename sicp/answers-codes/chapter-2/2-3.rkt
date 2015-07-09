; Exercise 2.3
;

; 这里的矩形，是特殊的矩形，不是什么矩形都可以的！！！！
; 为了不画math demo图，直接coding

#lang racket

; point
(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))


; rectangle
(define (make-rectangle x1 y1 x2 y2)
  (cons (make-point x1 y1) (make-point x2 y2)))

(define (point1-rectangle rect)
  (car rect))

(define (point2-rectangle rect)
  (cdr rect))

; representation
; parimeter
(define (parimeter rect)
  (let ((p1 (point1-rectangle rect))
        (p2 (point2-rectangle rect)))
    (* 2
       (+ (abs (- (x-point p1) (x-point p2)))
          (abs (- (y-point p1) (y-point p2)))))))

;  area
(define (area rect)
  (let ((p1 (point1-rectangle rect))
        (p2 (point2-rectangle rect)))
    (* (abs (- (x-point p1) (x-point p2)))
       (abs (- (y-point p1) (y-point p2))))))
