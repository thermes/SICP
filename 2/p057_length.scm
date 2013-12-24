#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (length items)
  (define (length-iter a count)
    (if (null? a)
	count
	(length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))

(define odds (list 1 3 5 7))

(define (main args)
 (print (length odds))
)
