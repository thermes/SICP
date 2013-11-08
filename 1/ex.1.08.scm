#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (abs x)
  (cond ((> x 0) x)
	((= x 0) 0)
	((< x 0) (- x))))

(define (cube-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-iter (improve guess x)
		 x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) 0.001))

(define (cube-root x)
  (cube-iter 1.0 x))
	 
(define (main args)
  (print (cube-root 27))
  (print (cube-root 1000000))
  (print (cube (cube-root 1000)))
  0)
