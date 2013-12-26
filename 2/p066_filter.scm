#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (myfilter predicate sequence)
  (cond ((null? sequence) nil)
	((predicate (car sequence))
	 (cons (car sequence)
	       (myfilter predicate (cdr sequence))))
	(else (myfilter predicate (cdr sequence)))))

(define (main args)
  (print (myfilter odd? (list 1 2 3 4 5)))
  0)
