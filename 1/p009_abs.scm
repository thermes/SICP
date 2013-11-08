#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (abs x)
  (cond ((> x 0) x)
	((= x 0) 0)
	((< x 0) (- x))))

(define (main args)
  (print (abs 2))
  (print (abs 0))
  (print (abs -2))
  0)
