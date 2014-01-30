#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (memq item x)
  (cond ((null? x) false)
	((eq? item (car x)) x)
	(else (memq item (cdr x)))))

(define (main args)
  (print (list 'a 'b 'c))
  (print (list (list 'george)))
  (print (cdr '((x1 x2) (y1 y2))))
  (print (cadr '((x1 x2) (y1 y2))))
  (print (pair? (car '(a short list))))
  (print (memq 'red '((red shoes) (blue socks))))
  (print (memq 'red '(red shoes blue socks)))
  0)
