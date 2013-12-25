#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (fringe tree)
  (cond ((null? tree)
	 nil)
	((pair? (car tree))
	 (append (fringe (car tree)) (fringe (cdr tree))))
	(else
	 (cons (car tree) (fringe (cdr tree))))))

(define (main args)
  (define x (list (list 1 2) (list 3 4)))

  (print (fringe x))
  (print (fringe (list x x)))
  0)
