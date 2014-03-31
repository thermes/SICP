#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define (cycle? list)
  (let ((encounted-lists '()))
    (define (iter list)
      (cond ((null? list) #f)
	    ((null? (cdr list)) #f)
	    ((memq list encounted-lists) #t)
	    (else
	     (set! encounted-lists (cons list encounted-lists))
	     (iter (cdr list)))))
    (iter list)))

(define (main args)
  (define z (make-cycle (list 'a 'b 'c )))

  (print (cycle? (list 'a 'b 'c)))
  (print (cycle? z))
  0)
