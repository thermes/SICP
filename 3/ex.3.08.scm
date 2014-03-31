#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (main args)
  (let ((a 0)
	(b 1))
    (define f
      (let ((status 1))
	(lambda (x)
	  (if (zero? x)
	      (begin (set! status 0)
		     status)
	      status))))
    (print (f a))
    (print (f b)))

  (let ((a 0)
	(b 1))
    (define f
      (let ((status 1))
	(lambda (x)
	  (if (zero? x)
	      (begin (set! status 0)
		     status)
	      status))))
    (print (f b))
    (print (f a)))
  0)
