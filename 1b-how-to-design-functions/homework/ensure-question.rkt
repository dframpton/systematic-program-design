;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ensure-question) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; ensure-question.rkt

;PROBLEM:
;
;Use the How to Design Functions (HtDF) recipe to design a function that consumes a string, and adds "?" 
;to the end unless the string already ends in "?".
;
;For this question, assume the string has length > 0. Follow the HtDF recipe and leave behind commented 
;out versions of the stub and template.

;; String -> String
;; Append "?" to the end of a given string if it doesn't already end in "?"
(check-expect (ensure-question "a") "a?")
(check-expect (ensure-question "how are you") "how are you?")
(check-expect (ensure-question "what?") "what?")

;(define (ensure-question s) "")

#;
(define (ensure-question s)
  (... s))

(define (ensure-question s)
  (if (string=? (substring s (- (string-length s) 1))
                "?")
      s
      (string-append s "?")))
