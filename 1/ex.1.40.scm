#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (cubic a b c)
  (lambda (x)
    (+ (cube x)
       (* a (square x))
       (* b x)
       c)))
