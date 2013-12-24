#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil '())

(define (reverse items)
  (if (null? items)
      nil
      (append (reverse (cdr items)) (list (car items)))))

(define (main args)
  (print (reverse (list 1 4 9 16 25)))
  (print (reverse '()))
)
