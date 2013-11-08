#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (inc x)
  (+ x 1))

(define (square x) (* x x))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (main args)
  (print ((compose square inc) 6))
  0)
