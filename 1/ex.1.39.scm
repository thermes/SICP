#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

;; recursive
(define (cont-frac n d k)
  (define (frac i)
    (if (> i k)
	0
	(/ (n i) (+ (d i) (frac (+ i 1))))))
  (frac 1))

;; iterative
(define (cont-frac n d k)
  (define (cont-frac-iter i result)
    (if (= i 0)
	result
	(cont-frac-iter (- i 1) (/ (n i) (+ (d i) result)))))
  (cont-frac-iter k 0.0))

(define (square x)
  (* x x))

(define (tan-cf x k)
     (cont-frac (lambda (i)
		  (if (= i 1)
		      x
		      (- (square x))))
		(lambda (i)
		  (- (* 2 i) 1))
		k))

(use srfi-1)

(define (main args)
  (for-each (lambda (k)
	      (print (tan-cf (/ 3.14159265358979323846264338327950288 4.0) k)))
	    (iota 20 1 1))
  0)
