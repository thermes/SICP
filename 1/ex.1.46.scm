#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (square x)
  (* x x))

(define (abs x)
  (cond ((> x 0) x)
	((= x 0) 0)
	((< x 0) (- x))))

(define (average x y)
  (/ (+ x y) 2))

(define tolerance 0.00001)

(define (iterative-improve enough? improve)
  (lambda (guess)
    (if (enough? guess)
	(improve guess)
	((iterative-improve enough? improve) (improve guess)))))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x))
       tolerance))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve
    good-enough?
    improve)
   1.0))

(define (fixed-point f first-guess)
  (define (close-enough? guess)
    (< (abs (- guess (f guess))) tolerance))
  ((iterative-improve
    close-enough?
    f)
   first-guess))

(define (main args)
  (print (sqrt 9))
  (print (sqrt (+ 100 37)))
  (print (sqrt (+ (sqrt 2) (sqrt 3))))
  (print (square (sqrt 1000)))
  (print (fixed-point cos 1.0))
  (print (fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0))
  0)
