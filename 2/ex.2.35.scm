#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define x (cons (list 1 2) (list 3 4)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate +
	      0
	      (map (lambda (x)
		     (if (pair? x)
			 (count-leaves x)
			 1))
		   t)))

(define (main args)
  (print x)
  (print (length x))
  (print (count-leaves x))
  (print (list x x))
  (print (length (list x x)))
  (print (count-leaves (list x x)))
  0)
