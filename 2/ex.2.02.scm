#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (make-segment start-p end-p)
  (cons start-p end-p))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment seg)
  (define (average a b)
    (/ (+ a b) 2.0))
  (make-point (average (x-point (start-segment seg)) (x-point (end-segment seg)))
	      (average (y-point (start-segment seg)) (y-point (end-segment seg)))))

(define (main args)
  (define p1 (make-point 1 2))
  (define p2 (make-point 12 5))
  (define seg (make-segment p1 p2))

  (print-point p1)
  (print-point p2)
  
  (print-point (midpoint-segment seg))

  (newline))
