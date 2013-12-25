#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (make-interval a b) (cons a b))

(define (lower-bound a) (min (car a) (cdr a)))

(define (upper-bound a) (max (car a) (cdr a)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
		 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
		(make-interval (/ 1.0 (upper-bound y))
			       (/ 1.0 (lower-bound y)))))

(define (new-div-interval x y)
  (if (<= (* (lower-bound y) (upper-bound y)) 0)
      (error "0 error")
      (mul-interval x
		    (make-interval (/ 1.0 (upper-bound y))
				   (/ 1.0 (lower-bound y))))))

(define (display-interval x)
  (display "[")
  (display (lower-bound x))
  (display ",")
  (display (upper-bound x))
  (display "]")
  (newline))

(define (main args)
  (define i1 (make-interval 4 5))
  (define i2 (make-interval 1 2))
  (define i3 (make-interval -1 2))

  (display-interval i1)
  (display-interval i2)
  (display-interval i3)

  (display-interval (div-interval i1 i2))
  (display-interval (div-interval i1 i3))

  (display-interval (new-div-interval i1 i2))
  (display-interval (new-div-interval i1 i3))
  0)
