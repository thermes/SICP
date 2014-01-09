#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
	    (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row)
	 (dot-product row v))
       m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
	   (matrix-*-vector cols row))
	 m)))

(define (main args)
  (define m (list (list 1 2 3 4)
		  (list 4 5 6 6)
		  (list 6 7 8 9)))
  (define v (list 1 2 3 4))
  (define w (list 5 6 7 8))

  (define a (list (list 1 -1) (list -2 3)))
  (define b (list (list 1 2) (list 3 4)))

  (print (dot-product v w))
  (print (matrix-*-vector m v))
  (print (transpose m))
  (print (matrix-*-matrix a b))
  0)
