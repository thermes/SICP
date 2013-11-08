#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (inc x)
  (+ x 1))

(define (double func)
  (lambda (x)
    (func (func x))))

(define (main args)
  (print (((double (double double)) inc) 5))
  0)
