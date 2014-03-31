#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

;; see also: http://ja.wikipedia.org/wiki/%E3%83%95%E3%83%AD%E3%82%A4%E3%83%89%E3%81%AE%E5%BE%AA%E7%92%B0%E6%A4%9C%E5%87%BA%E6%B3%95
(define (cycle? list)
  (define (iter x1 x2)
    (cond ((eq? x1 x2) #t)
	  ((null? (cdr x2)) #f)
	  ((null? (cddr x2)) #f)
	  (else
	   (iter (cdr x1) (cddr x2)))))
  (if (and (pair? list) (pair? (cdr list)))
      (iter (cdr list) (cddr list))
      #f))

(define (main args)
  (define z (make-cycle (list 'a 'b 'c )))

  (print (cycle? (list 'a 'b 'c)))
  (print (cycle? z))
  0)
