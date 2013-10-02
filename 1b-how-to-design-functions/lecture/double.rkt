;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname double) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; double.rkt

;PROBLEM:
;
;Design a function that consumes a number and produces twice that number. 
;Call your function double. Follow the HtDF recipe and leave behind commented 
;out versions of the stub and template.

;; Number -> Number
;; Produce 2 times the given number
(check-expect (double 3) (* 2 3))
(check-expect (double 4.2) (* 2 4.2))

;(define (double n) 0)  ; stub

;(define (double n)     ; template
;  (... n))

(define (double n)
  (* 2 n))
