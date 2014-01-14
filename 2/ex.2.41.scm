#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (orderd-triples n)
  (flatmap (lambda (i)
	 (flatmap (lambda (j)
		(map (lambda (k) (list i j k))
		     (enumerate-interval (+ j 1) n)))
	      (enumerate-interval (+ i 1) (- n 1))))
       (enumerate-interval 1 (- n 2))))

(define (orderd-triples-sum n s)
  (filter (lambda (triples)
	    (= (accumulate + 0 triples) s))
	  (orderd-triples n)))

(define (main args)
  (print (orderd-triples-sum 5 8))
  (print (orderd-triples-sum 5 9))
  (print (orderd-triples-sum 6 7))
  (print (orderd-triples-sum 12 12))
  0)
