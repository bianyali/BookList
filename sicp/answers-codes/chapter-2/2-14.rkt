; Exercise 2.14
; Parallel-resistors formula in two ways.
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


(define (div-interval-with-check x y)
  (if (= (spans y) 0)
      'error
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define (spans interval)
  (- (upper-bound interval)
     (lower-bound interval)))

(define (center interval)
  (/ (+ (lower-bound interval)
        (upper-bound interval))
     2))

(define (ratio interval)
  (/ (- (upper-bound interval)
        (lower-bound interval))
     (center interval)
     2))

(define (par1 r1 r2)
  (div-interval-with-check (mul-interval r1 r2)
                           (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))



(define (print-interval-in-center-percent-form interval)
  (newline)
  (newline)
  (display "Interval:")
  (newline)
  (display "         center: ")
  (display (center interval))
  (newline)
  (display "          ratio: ")
  (display (ratio interval))
  (newline))

(print-interval-in-center-percent-form (par1 (make-interval 1 2)
                                             (make-interval 3 4)))

(print-interval-in-center-percent-form (par2 (make-interval 1 2)
                                             (make-interval 3 4)))
