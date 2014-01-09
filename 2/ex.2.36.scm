#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define x (cons (list 1 2) (list 3 4)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
	    (accumulate-n op init (map cdr seqs)))))

(define (main args)
  (define s (list (list 1 2 3)
		  (list 4 5 6)
		  (list 7 8 9)))

  (print s)

  (print (accumulate-n + 0 s))
  0)
