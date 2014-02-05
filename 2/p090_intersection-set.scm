#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (car set)) #t)
        ((< x (car set)) #f)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()    
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((< x2 x1)
               (intersection-set set1 (cdr set2)))))))

(define (adjoin-set x set)
  (cons x set))

(define (union-set set1 set2)
  (append set1 set2))

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
