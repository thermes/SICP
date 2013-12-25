#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define x (list 1 3 (list 5 7) 9))

(define y (list (list 7)))

(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(define (main args)
  (print x)
  (print (car (cdr (car (cdr (cdr x))))))
  (newline)

  (print y)
  (print (car (car y)))
  (newline)

  (print z)
  (print (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr z)))))))))))))
  0)
