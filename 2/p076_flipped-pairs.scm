#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (flipped-pairs painter)
  (let ((painter2 (beside painter (flip-vert painter))))
    (below painter2 painter2)))
