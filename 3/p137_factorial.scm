#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
	product
	(iter (* counter product)
	      (+ counter 1)))))

(define (factorial n)
  (let ((product 1)
	(counter 1))
    (define (iter)
      (if (> counter n)
	  product
	  (begin (set! product (* counter product))
		 (set! counter (+ counter 1))
		 (iter))))
    (iter)))

(define (main args)
  (print (factorial 5))
  0)
