#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-rect1 start-p end-p)
  (cons start-p end-p))

(define (make-rect2 point width height)
  (cons point
	(make-point (+ (x-point point) width) (+ (y-point point) height))))

(define (start-point rect)
  (car rect))

(define (end-point rect)
  (cdr rect))

(define (perimeter rect)
  (let ((sp (start-point rect))
	(ep (end-point rect)))
    (* (+ (abs (- (x-point ep) (x-point sp)))
	  (abs (- (y-point ep) (y-point sp))))
       2)))

(define (area rect)
  (let ((sp (start-point rect))
	(ep (end-point rect)))
    (* (abs (- (x-point ep) (x-point sp)))
       (abs (- (y-point ep) (y-point sp))))))

(define (main args)
  (define p1 (make-point 1 -2))
  (define p2 (make-point -12 5))
  (define rect1 (make-rect1 p1 p2))
  (define rect2 (make-rect2 p1 -21 12))

  (print-point p1)
  (print-point p2)
  
  (newline)
  (display (perimeter rect1))
  (newline)
  (display (area rect1))
  (newline)
  (display (perimeter rect2))
  (newline)
  (display (area rect2))

  (newline)
  0)
