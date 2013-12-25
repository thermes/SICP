#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (square x)
  (* x x))

(define (square-tree tree)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (square-tree sub-tree)
	     (square sub-tree)))
       tree))

(define (square-tree2 tree)
  (cond ((null? tree)
	 nil)
	((pair? (car tree))
	 (list (square-tree (car tree)) (square-tree (cdr tree))))
	(else
	 (cons (square (car tree)) (square-tree (cdr tree))))))


;; (define (fringe tree)
;;   (cond ((null? tree)
;; 	 nil)
;; 	((pair? (car tree))
;; 	 (append (fringe (car tree)) (fringe (cdr tree))))
;; 	(else
;; 	 (cons (car tree) (fringe (cdr tree))))))



(define (main args)
  (print (square-tree (list 1
			    (list 2 (list 3 4) 5)
			    (list 6 7))))

  (print (square-tree2 (list 1
			    (list 2 (list 3 4) 5)
			    (list 6 7))))

  (print (square-tree nil))
  0)
