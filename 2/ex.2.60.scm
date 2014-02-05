#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (element-of-set? x set)
  (list? (memq x set)))

(define (adjoin-set x set)
  (cons x set))

(define (union-set set1 set2)
  (append set1 set2))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)        
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (main args)
  (define set '(2 3 2 1 3 2 2))
  (define odds '(1 3 5 7 9))
  (define evens '(2 4 6 8 10))
  (define primes '(2 3 5 7))

  (print (element-of-set? 1 set))
  (print (element-of-set? 5 set))

  (print (union-set set odds))
  (print (union-set set evens))

  (print (intersection-set set odds))
  (print (intersection-set set evens))

  (print (intersection-set odds  set))
  (print (intersection-set evens set))
  0)
