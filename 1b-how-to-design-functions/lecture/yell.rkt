;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname yell) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; yell.rkt

;PROBLEM:
;
;Design a function called yell that consumes strings like "hello" 
;and adds "!" to produce strings like "hello!".
;
;Remember, when we say DESIGN, we mean follow the recipe.
;
;Leave behind commented out versions of the stub and template.

;; String -> String
;; Add "!" to the end of a given string
(check-expect (yell "") "!")
(check-expect (yell "X") "X!")
(check-expect (yell "hello") "hello!")

;(define (yell s) "")   ; stub

;(define (yell s)        ; template
;  (... s))

(define (yell s)
  (string-append s "!"))
