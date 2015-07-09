; Exercise 2.8
; Sub-interval

#lang racket

(define (make-interval a b)
  (cons a b))

(define (lower-bound interval)
  (if (< (car interval)
         (cdr interval))
      (car interval)
      (cdr interval)))

(define (upper-bound interval)
  (if (> (car interval)
         (cdr interval))
      (car interval)
      (cdr interval)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
               (lower-bound y)))
        (p2 (* (lower-bound x)
               (upper-bound y)))
        (p3 (* (upper-bound x)
               (lower-bound y)))
        (p4 (* (upper-bound x)
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))


(define (sub-interval x y)
  (let ((p1 (abs (- (lower-bound x)
                    (lower-bound y))))
        (p2 (abs (- (lower-bound x)
                    (upper-bound y))))
        (p3 (abs (- (upper-bound x)
                    (lower-bound y))))
        (p4 (abs (- (upper-bound x)
                    (upper-bound y)))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; Test
(make-interval 1 2)

(lower-bound (make-interval 1 2))
(upper-bound (make-interval 2 1))

(add-interval (make-interval 2 1)
              (make-interval 2 4))

(mul-interval (make-interval 1 2)
              (make-interval 2 4))

(sub-interval (make-interval 2 4)
              (make-interval 1 5))
