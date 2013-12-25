#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (tree-map proc tree)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (tree-map proc sub-tree)
	     (proc sub-tree)))
       tree))

(define (square x)
  (* x x))

(define (square-tree tree)
  (tree-map square tree))

(define (main args)
  (print (square-tree (list 1
			    (list 2 (list 3 4) 5)
			    (list 6 7))))

  (print (square-tree nil))
  0)
