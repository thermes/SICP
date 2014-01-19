#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

;; a
;; pending...


;; b
(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (beside (below painter (up-split painter (- n 1)))
	      (below (right-split painter (- n 1)) (corner-split painter (- n 1))))))


;; c
(define (square-of-four tl tr bl tr)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-vert rotate180
				  identity flip-horiz)))
    (combine4 (corner-split painter n))))
