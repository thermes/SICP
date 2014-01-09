#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define squares (list 1 4 9 16 25))

(define odds (list 1 3 5 7))

(define (main args)
  (print (append squares odds))
  (print (append odds squares))
  0)
