; Exercise 2.47
; implementation for frames

#lang racket

(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2)) (+ (ycor-vect v1) (+ (ycor-vect v2)))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2)) (- (ycor-vect v1) (+ (ycor-vect v2)))))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v)) (* s (ycor-vect v))))


(define (make-frame-list origin edge1 edge2)
  (list origin edge1 edge2))
(define (origin-frame-list frame)
  (car frame))
(define (edge1-frame-list frame)
  (cadr frame))
(define (edge2-frame-list frame)
  (caddr frame))
(define (frame-coord-map-list frame)
  (lambda (v)
    (add-vect (origin-frame-list frame)
              (add-vect (scale-vect (xcor-vect v) (edge1-frame-list frame))
                        (scale-vect (ycor-vect v) (edge2-frame-list frame))))))


(define (make-frame-cons origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (origin-frame-cons frame)
  (car frame))
(define (edge1-frame-cons frame)
  (car (cdr frame)))
(define (edge2-frame-cons frame)
  (cdr (cdr frame)))
(define (frame-coord-map-cons frame)
  (lambda (v)
    (add-vect (origin-frame-cons frame)
              (add-vect (scale-vect (xcor-vect v) (edge1-frame-cons frame))
                        (scale-vect (ycor-vect v) (edge2-frame-cons frame))))))


; test
(define v (make-vect 1 2))
(define v1 (make-vect 1 1))
(define v2 (make-vect 2 2))

((frame-coord-map-list (make-frame-list v v1 v2)) (make-vect 1 1))
v
((frame-coord-map-cons (make-frame-cons v v1 v2)) (make-vect 1 1))
v
