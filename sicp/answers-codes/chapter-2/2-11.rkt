; Exercise 2.11
; Check an interval that spans zero
;

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


(define (width-interval interval)
  (/ (+ (lower-bound interval)
        (upper-bound interval))
     2))

(define (width-test f g x y)
  (if (= (width-interval (f x y))
         (g (width-interval x)
            (width-interval y)))
      'Yes
      'No))



(define (div-interval-with-check x y)
  (if (= (spans y) 0)
      'error
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define (spans interval)
  (- (upper-bound interval)
     (lower-bound interval)))


(define (mul-interval-with-suggestion x y)
  (let ((x1 (lower-bound x))
        (x2 (upper-bound x))
        (y1 (lower-bound y))
        (y2 (lower-bound y)))
    (cond ((and (< x1 0) (< x2 0)) (cond ((and (< y1 0) (< y2 0)) (make-interval (* x2 y2) (* x1 y2)))
                                         ((and (< y1 0) (> y2 0)) (make-interval (* x1 y2) (* x1 y1)))
                                         ((and (> y1 0) (> y2 0)) (make-interval (* x1 y2) (* x2 y1)))))

          ((and (< x1 0) (> x2 0)) (cond ((and (< y1 0) (< y2 0)) (make-interval (* y1 x2) (* y1 x1)))
                                         ((and (< y1 0) (> y2 0)) (make-interval (min (* x1 y2) (* x2 y1))
                                                                                (max (* x1 y1) (* x2 y2))))
                                         ((and (> y1 0) (> y2 0)) (make-interval (* y2 x1) (* x2 y2)))))

          ((and (> x1 0) (> x2 0)) (cond ((and (< y1 0) (< y2 0)) (make-interval (* x2 y1) (* x1 y2)))
                                         ((and (< y1 0) (> y2 0)) (make-interval (* x2 y1) (* x2 y2)))
                                         ((and (> y1 0) (> y2 0)) (make-interval (* x1 y1) (* x2 y2))))))))

; Test
(mul-interval-with-suggestion (make-interval -1 2) (make-interval -2 1))


(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center interval)
  (/ (+ (lower-bounder interval)
        (upper-bounder inerval))
     2))

(define (witdh inerval)
  (/ (- (upper-bounder interval)
        (lower-bounder interval))
     2))

(define (make-ratio-midpoint ratio midpoint)
  (make-center-width (* ratio midpoint) midpoint))

(define (ratio interval)
  (/ (width interval) (center interval)))

(define (midpoint interval)
  (center interval))
