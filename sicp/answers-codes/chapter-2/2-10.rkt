; Exercise 2.10
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


; test
;
(div-interval-with-check (make-interval 1 2)
                         (make-interval 3 3))

(div-interval-with-check (make-interval 1 2)
                         (make-interval 3 5))
