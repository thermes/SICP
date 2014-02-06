#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (element-of-set? x set)
  (cond ((null? set) #f)
	((equal? x (car set)) #t)
	(else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
	((element-of-set? (car set1) set2)
	 (cons (car set1)
	       (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))

(define (main args)
  (define odd '(1 3 5 7 9))
  (define even '(2 4 6 8 10))
  (define prime '(2 3 5 7))

  (print (intersection-set odd even))
  (print (intersection-set odd prime))
  (print (intersection-set even prime))
  0)
