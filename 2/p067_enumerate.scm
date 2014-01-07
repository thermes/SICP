#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
	((not (pair? tree)) (list tree))
	(else (append (enumerate-tree (car tree))
		      (enumerate-tree (cdr tree))))))

(define (main args)
  (print (enumerate-interval 2 7))
  (print (enumerate-tree (list 1 (list 2 (list 3 4)) 5)))
  0)
