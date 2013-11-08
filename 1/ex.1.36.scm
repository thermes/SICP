#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define tolerance 0.000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (main args)
  (print (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0))
  (newline)
  (print (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0))
  0)
