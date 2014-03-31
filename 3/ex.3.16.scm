#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
	 (count-pairs (cdr x))
	 1)))

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
