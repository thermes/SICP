#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) #f)
	((equal? given-key (key (car set-of-records)))
	 (car set-of-records))
	(else (lookup given-key (cdr set-of-records)))))
