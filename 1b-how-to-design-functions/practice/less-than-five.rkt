;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname less-than-five) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; less-than-five.rkt

;PROBLEM:
;
;DESIGN a function that consumes a string and determines whether its length is
;less than 5. Follow the HtDF recipe and leave behind commented out versions 
;of the stub and template.

;; String -> Boolean
;; Produce true is the length of a given string is less than 5 characters
(check-expect (less-than-five? "") true)
(check-expect (less-than-five? "cat") true)
(check-expect (less-than-five? "hello") false)
(check-expect (less-than-five? "banana") false)

;(define (less-than-five? s) false)   ; stub

;(define (less-than-five? s)          ; template
;  (... s))

(define (less-than-five? s)
  (< (string-length s) 5))
