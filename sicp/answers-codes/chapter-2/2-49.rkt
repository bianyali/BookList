; Exercise 2.49
; define primitive painters
;

#lang racket

(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v)) (* s (ycor-vect v))))

(define (make-segment v1 v2)
  (list v1 v2))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cadr seg))


(define (segment->painter segment-list)
  (lambda (frame)
    (for-each (segment)
              (draw-line ((frame-coord-map frame)
                          (start-segment segment))
                         ((frame-coord-map frame)
                          (end-segment segment)))
              segment-list)))

                        ;(sub-vec (add-vec (edge1-frame frame) (edge2-frame frame))
(define (draws-frame frame)
  (let ((seg-list-1 (list (origin-frame frame)
                        (edge1-frame frame)))
        (seg-list-2 (list (origin-frame frame)
                          (edge2-frame frame)))
        (seg-list-3 (list (edge1-frame frame)
                        (sub-vec (add-vec (edge1-frame frame) (edge2-frame frame)))))
        (seg-list-4 (list (edge2-frame frame)
                        (sub-vec (add-vec (edge1-frame frame) (edge2-frame frame))))))
    (segment->painter seg-list-1)
    (segment->painter seg-list-2)
    (segment->painter seg-list-3)
    (segment->painter seg-list-4)))

(define (draw-X frame)
  (let ((seg-list-1 (origin-frame frame)
                    (sub-vec (add-vec (edge1-frame frame) (edge2-frame frame))))
        (seg-list-2 (edge1-frame frame)
                    (edge2-frame frame)))
    (segment->painter seg-list-1)
    (segment->painter seg-list-2)))
