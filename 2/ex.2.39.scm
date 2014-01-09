#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter initial sequence))

(define (reverse-r sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (reverse-l sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(define (main args)
  (print (reverse-r (list 1 4 9 16 25)))
  (print (reverse-r '()))

  (print (reverse-l (list 1 4 9 16 25)))
  (print (reverse-l '()))
  0)
