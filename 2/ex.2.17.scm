#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (last-pair items)
  (cond ((or (null? items) (null? (cdr items)))
	 items)
	(else
	 (last-pair (cdr items)))))

(define (main args)
  (print (last-pair (list 23 72 149 34)))
  (print (last-pair '()))
  0)
