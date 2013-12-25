#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (scale-list items factor)
  (if (null? items)
      nil
      (cons (* (car items) factor)
	    (scale-list (cdr items) factor))))

(define (main args)
  (print (scale-list (list 1 2 3 4 5) 10))
  0)
