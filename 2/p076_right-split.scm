#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
	(beside painter (below smaller smaller)))))
