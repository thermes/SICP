#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) #f)
	((= x (entry set)) #t)
	((< x (entry set))
	 (element-of-set? x (left-branch set)))
	((> x (entry set))
	 (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
	((= x (entry set)) set)
	((< x (entry set))
	 (make-tree (entry set)
		    (adjoin-set x (left-branch set))
		    (right-branch set)))
	((> x (entry set))
	 (make-tree (entry set)
		    (left-branch set)
		    (adjoin-set x (right-branch set))))))

(define (main args)
  

  (define odds '(1 3 5 7 9))
  (define evens '(2 4 6 8 10))
  (define primes '(2 3 5 7))



  (print (intersection-set odds evens))
  (print (intersection-set odds primes))
  (print (intersection-set evens primes))
  0)
