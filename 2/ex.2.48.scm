#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (make-vect x y)
  (cons x y))

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (main args)
  (define v_1_3 (make-vect 1 3))
  (define v_2_6 (make-vect 2 6))
  (define segment (make-segment v_1_3 v_2_6))

  (print (start-segment segment))
  (print (end-segment segment))
  0)
