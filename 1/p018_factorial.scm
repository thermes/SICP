#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))
	 
(define (main args)
  (print (factorial 6))
  0)
