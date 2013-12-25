#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (for-each proc items)
  (cond ((not (null? items))
	 (proc (car items))
	 (for-each proc (cdr items)))))

(define (main args)
  (for-each (lambda (x) (newline) (display x))
	    (list 57 321 88))
  0)
