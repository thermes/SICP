#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (count-pairs x)
  (let ((encounted-pairs '()))
    (define (count x)
      (if (or (not (pair? x)) (memq x encounted-pairs))
	  0
	  (begin
	    (set! encounted-pairs (cons x encounted-pairs))
	    (+ (count (car x))
	       (count (cdr x))
	       1))))
    (count x)))

(define (main args)
  (let ()
    (define l (list 'a 'b 'c))
    (print (count-pairs l)))

  (let ()
    (define x (list 'a))
    (define y (cons 'b x))
    (define l (cons y x))
    (print (count-pairs l)))

  (let ()
    (define x (cons 'a (cons 'b (cons 'c '()))))
    (set-car! (cdr x) (cdr (cdr x)))
    (set-car! x (cdr x))
    (print (count-pairs x)))
  0)
