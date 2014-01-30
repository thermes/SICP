#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (equal? a b)
  (cond ((and (not (pair? a)) (not (pair? b)))
	 (eq? a b))
	((and (pair? a) (pair? b))
	 (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))
	(else #f)))

(define (main args)
  (print (equal? '(this is a list) '(this is a list)))
  (print (equal? '(this is a list) '(this (is a) list)))
  0)
