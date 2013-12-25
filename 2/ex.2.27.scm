#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (reverse items)
  (if (null? items)
      nil
      (append (reverse (cdr items)) (list (car items)))))

(define (deep-reverse tree)
  (cond ((null? tree)
	 nil)
	((pair? (car tree))
	 (append (deep-reverse (cdr tree)) (list (deep-reverse (car tree)))))
	(else
	 (append (deep-reverse (cdr tree)) (list (car tree))))))

(define (main args)
  (define x (list (list 1 2) (list 3 4)))

  (print (reverse x))
  (print (deep-reverse x))
  0)
