#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (set-to-wow! x)
  (set-car! (car x) 'wow)
  x)

(define (main args)
  (define x (list 'a 'b))
  (define z1 (cons x x))
  (define z2 (cons (list 'a 'b) (list 'a 'b)))

  (print z1)
  (print (set-to-wow! z1))

  (print z2)
  (print (set-to-wow! z2))
  0)
