;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname area) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; area.rkt

;PROBLEM:
;
;DESIGN a function called area that consumes the length of one side 
;of a square and produces the area of the square.
;
;Remember, when we say DESIGN, we mean follow the recipe.
;
;Leave behind commented out versions of the stub and template.

;; Number -> Number
;; Produce the area of a square given its side length
(check-expect (area 4) (* 4 4))
(check-expect (area 5.5) (* 5.5 5.5))

;(define (area n) 0)   ; stub

;(define (area n)      ; template
;  (... n))

(define (area n)
  (* n n))
