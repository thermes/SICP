#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (same-parity x . items)
  (let ((proc (if (= (modulo x 2) 0)
		  even?
		  odd?)))
    (cond ((null? items)
	   nil)
	  (else
	   (cons (if (proc (car items))
		     (car items)
		     nil)
		 (same-parity x (cdr items)))))))
	
	      
	      

(define (main args)
  (print (same-parity 1 2 3 4 5 6 7))
  (print (same-parity 2 3 4 5 6 7))
  (print (same-parity 3 4 5 6 7))
  0)
