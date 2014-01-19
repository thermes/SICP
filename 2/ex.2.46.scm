#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1)
		(xcor-vect v2))
	     (+ (ycor-vect v1)
		(ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1)
		(xcor-vect v2))
	     (- (ycor-vect v1)
		(ycor-vect v2))))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
	     (* s (ycor-vect v))))

(define (main args)
  (define v_1_3 (make-vect 1 3))
  (define v_2_6 (make-vect 2 6))

  (print (add-vect v_1_3 v_2_6))
  (print (sub-vect v_1_3 v_2_6))
  (print (scale-vect 3 v_1_3))
  0)
