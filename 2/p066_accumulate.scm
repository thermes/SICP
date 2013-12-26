#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (myfilter predicate sequence)
  (cond ((null? sequence) nil)
	((predicate (car sequence))
	 (cons (car sequence)
	       (myfilter predicate (cdr sequence))))
	(else (myfilter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (main args)
  (print (accumulate + 0 (list 1 2 3 4 5)))
  (print (accumulate * 1 (list 1 2 3 4 5)))
  (print (accumulate cons nil (list 1 2 3 4 5)))
  0)
