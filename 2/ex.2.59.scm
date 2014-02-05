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

(define (union-set set1 set2)
  (cond ((null? set1) set2)
	((null? set2) set1)
	((element-of-set? (car set1) set2)
	 (union-set (cdr set1) set2))
	(else
	 (cons (car set1)
	       (union-set (cdr set1) set2)))))

(define (union-set set1 set2)
  (append set1
	  (filter (lambda (x) (not (element-of-set? x set1))) set2)))

(define (main args)
  (define odds '(1 3 5 7 9))
  (define evens '(2 4 6 8 10))
  (define primes '(2 3 5 7))

  (print (intersection-set odds evens))
  (print (intersection-set odds primes))
  (print (intersection-set evens primes))

  (print (union-set odds evens))
  (print (union-set odds primes))
  (print (union-set evens primes))
  0)
