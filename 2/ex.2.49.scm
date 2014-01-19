#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1)
                (xcor-vect v2))
             (+ (ycor-vect v1)
                (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1)
                (xcor-vect v2))
             (- (ycor-vect v1)
                (ycor-vect v2))))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (car (cdr frame)))

(define (edge2-frame frame)
  (car (cdr (cdr frame))))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

;; ;; a
(define (outline-painter frame)
  (segments->painter (list
		      (make-segment (make-vect 0.0 0.0) (make-vect 0.0 1.0))
		      (make-segment (make-vect 0.0 1.0) (make-vect 1.0 1.0))
		      (make-segment (make-vect 1.0 1.0) (make-vect 1.0 0.0))
		      (make-segment (make-vect 1.0 0.0) (make-vect 0.0 0.0)))))

;; b
(define (x-painter frame)
  (segments->painter (list
		      (make-segment (make-vect 0.0 0.0) (make-vect 1.0 1.0))
		      (make-segment (make-vect 0.0 1.0) (make-vect 1.0 0.0)))))

;; c
(define (diamond-painter frame)
  (segments->painter (list
		      (make-segment (make-vect 0.0 0.5) (make-vect 0.5 1.0))
		      (make-segment (make-vect 0.5 1.0) (make-vect 1.0 0.5))
		      (make-segment (make-vect 1.0 0.5) (make-vect 0.5 0.0))
		      (make-segment (make-vect 0.5 0.0) (make-vect 0.0 0.5)))))

;; d
(define (wave-painter frame)
  (segments->painter (list
		      (make-segment (make-vect 0.006 0.840) (make-vect 0.155 0.591))
		      (make-segment (make-vect 0.006 0.635) (make-vect 0.155 0.392))
		      (make-segment (make-vect 0.304 0.646) (make-vect 0.155 0.591))
		      (make-segment (make-vect 0.298 0.591) (make-vect 0.155 0.392))
		      (make-segment (make-vect 0.304 0.646) (make-vect 0.403 0.646))
		      (make-segment (make-vect 0.298 0.591) (make-vect 0.354 0.492))
		      (make-segment (make-vect 0.403 0.646) (make-vect 0.348 0.845))
		      (make-segment (make-vect 0.354 0.492) (make-vect 0.249 0.000))
		      (make-segment (make-vect 0.403 0.000) (make-vect 0.502 0.293))
		      (make-segment (make-vect 0.502 0.293) (make-vect 0.602 0.000))
		      (make-segment (make-vect 0.348 0.845) (make-vect 0.403 0.999))
		      (make-segment (make-vect 0.602 0.999) (make-vect 0.652 0.845))
		      (make-segment (make-vect 0.652 0.845) (make-vect 0.602 0.646))
		      (make-segment (make-vect 0.602 0.646) (make-vect 0.751 0.646))
		      (make-segment (make-vect 0.751 0.646) (make-vect 0.999 0.343))
		      (make-segment (make-vect 0.751 0.000) (make-vect 0.597 0.442))
		      (make-segment (make-vect 0.597 0.442) (make-vect 0.999 0.144)))))
