#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))

(define (main args)
  (print (map abs (list -10 2.5 -11.6 17)))
  (print (map (lambda (x) (* x x))
	      (list 1 2 3 4)))
  (print (scale-list (list 1 2 3 4 5) 10))
  0)
