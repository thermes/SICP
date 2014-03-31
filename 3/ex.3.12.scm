#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (append x y)
  (if (null? x)
      y
      (cons (car x) (append (cdr x) y))))

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (main args)
  (let ()
    (define x (list 'a 'b))
    (define y (list 'c 'd))
    (define z (append x y))
    (print z)
    (print (cdr x)))

  (let ()
    (define x (list 'a 'b))
    (define y (list 'c 'd))
    (define w (append! x y))
    (print w)
    (print (cdr x)))
  0)
