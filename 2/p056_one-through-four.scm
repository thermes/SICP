#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define one-through-four (list 1 2 3 4))

(define (main args)
  (print one-through-four)
  (print (car one-through-four))
  (print (cdr one-through-four))
  (print (car (cdr one-through-four)))
  (print (cons 10 one-through-four))
  (print (cons 5 one-through-four))
  0)
