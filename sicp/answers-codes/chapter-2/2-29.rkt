; Exercise 2.29
; A binary mobile

#lang racket

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (total-weight mobile)
  (let ((left-structure (branch-structure (left-branch mobile)))
        (right-structure (branch-structure (right-branch mobile))))
    (+ (if (list?  left-structure)
           (total-weight left-structure)
           left-structure)
       (if (list? right-structure)
           (total-weight right-structure)
           right-structure))))

(define (balanced-mobile? mobile)
  (let ((left-structure (branch-structure (left-branch mobile)))
        (left-length (branch-length (left-branch mobile)))
        (right-structure (branch-structure (right-branch mobile)))
        (right-length (branch-length (right-branch mobile))))
    (let ((left-weight (if (list? left-structure)
                           (total-weight left-structure)
                           left-structure))
          (right-weight (if (list? right-structure)
                            (total-weight right-structure)
                            right-structure)))
      (if (= (* left-weight left-length)
             (* right-weight right-length))
          (and (if (list? left-structure)
                   (balanced-mobile? left-structure)
                   #t)
               (if (list? right-structure)
                   (balanced-mobile? right-structure)
                   #t))
          #f))))



(define mobile-1 (make-mobile (make-branch 1 1)
                            (make-branch 1 1)))

(define mobile-2 (make-mobile (make-branch 1 (make-mobile (make-branch 1 1)
                                                          (make-branch 1 1)))
                              (make-branch 1 2)))

(define mobile-3 (make-mobile (make-branch 1 (make-mobile (make-branch 1 2)
                                                          (make-branch 1 (make-mobile (make-branch 1 1)
                                                                                      (make-branch 1 1)))))
                              (make-branch 1 4)))

(define mobile-4 (make-mobile (make-branch 1 (make-mobile (make-branch 1 1)
                                                          (make-branch 1 (make-mobile (make-branch 1 1)
                                                                                      (make-branch 1 1)))))
                              (make-branch 1 3)))




; test a:
;(left-branch mobile-1)
;(right-branch mobile-1)
;(newline)
;(left-branch mobile-2)
;(right-branch mobile-2)
;(newline)
;(display "---------------------")
;(newline)
;(branch-length (left-branch mobile-1))
;(branch-structure (right-branch mobile-1))

;(newline)
;(branch-length (left-branch mobile-2))
;(branch-structure (left-branch mobile-2))

; test b:
;(display "-------------------")
;(newline)
;(total-weight mobile-1)
;(total-weight mobile-2)

; test c:
(balanced-mobile? mobile-1)
(balanced-mobile? mobile-2)
(balanced-mobile? mobile-3)
(balanced-mobile? mobile-4)

; test d : change the left-branch, right-branch, branch-length and branch-strucure
