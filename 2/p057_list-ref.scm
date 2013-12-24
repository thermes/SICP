#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define squares (list 1 4 9 16 25))

(define (main args)
 (print (list-ref squares 3))
)
