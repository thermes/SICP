#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (square x)
  (* x x))

(define (abs x)
  (cond ((> x 0) x)
	((= x 0) 0)
	((< x 0) (- x))))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))
	 
(define (main args)
  (print (sqrt 4))
  (print (sqrt 1000000000000))
  (print (sqrt 10000000000000))
  (print (square (sqrt 1000)))
  0)
