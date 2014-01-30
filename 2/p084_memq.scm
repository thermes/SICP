#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (memq item x)
  (cond ((null? x) false)
	((eq? item (car x)) x)
	(else (memq item (cdr x)))))

(define (main args)
  (print (memq 'apple '(pear banana prune)))
  (print (memq 'apple '(x (apple sauce) y apple pear)))
  0)
