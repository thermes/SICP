#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (main args)
  (print (car ''abracadabra))
  (print (car (quote 'abracadabra)))
  (print (car (quote (quote abracadabra))))
  0)
