#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (square x)
  (* x x))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (product-of-squares-of-odd-elements sequence)
  (accumulate *
	      1
	      (map square
		   (filter odd? sequence))))

(define (main args)
  (print (product-of-squares-of-odd-elements (list 1 2 3 4 5)))
  0)
