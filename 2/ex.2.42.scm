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

(define (adjoin-position row col rest)
  (cons row rest))

(define empty-board nil)

(define (safe? k positions)
  (define (col-safe? col positions offset)
    (cond ((null? positions) #t)
  	  ((or (= col (car positions))
	       (= (+ col offset) (car positions))
	       (= (- col offset) (car positions)))
	   #f)
  	  (else
  	   (col-safe? col (cdr positions) (+ 1 offset)))))
  (if (null? positions)
      #t
      (if (null? (cdr positions))
	  #t
  	  (col-safe? (car positions) (cdr positions) 1))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (main args)
  ;; ((3 1 4 2) (2 4 1 3))
  (print (queens 4))

  (print (length (queens 8)))
  (print (queens 8))
  0)
