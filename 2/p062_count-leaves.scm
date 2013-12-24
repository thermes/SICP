#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define x (cons (list 1 2) (list 3 4)))

(define (count-leaves x)
  (cond ((null? x) 0)
	((not (pair? x)) 1)
	(else (+ (count-leaves (car x))
		 (count-leaves (cdr x))))))
	 
(define (main args)
  (print x)
  (print (length x))
  (print (count-leaves x))
  (print (list x x))
  (print (length (list x x)))
  (print (count-leaves (list x x)))
)
