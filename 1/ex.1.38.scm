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

(define (e-euler k)
  (+ 2.0
     (cont-frac (lambda (i) 1.0)
		(lambda (i)
		  (if (= (remainder i 3) 2)
		      (/ (+ i 1) 1.5)
		      1))
		k)))


(use srfi-1)

(define (main args)
  (for-each (lambda (k)
	      (print (e-euler k)))
	    (iota 20 1 1))
  0)
