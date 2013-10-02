;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname yell-all) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; yell-all.rkt



;; =================
;; Data definitions:

;Remember the data definition for a list of strings we designed in Lecture 5c:
;(if this data definition does not look familiar, please review the lecture)

;; ListOfString is one of: 
;;  - empty
;;  - (cons String ListOfString)
;; interp. a list of strings

(define LS0 empty) 
(define LS1 (cons "a" empty))
(define LS2 (cons "a" (cons "b" empty)))
(define LS3 (cons "c" (cons "b" (cons "a" empty))))

#;
(define (fn-for-los los) 
  (cond [(empty? los) (...)]
        [else
         (... (first los)
              (fn-for-los (rest los)))]))

;; Template rules used: 
;; - one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons String ListOfString)
;; - atomic non-distinct: (first los) is  String
;; - self-reference: (rest los) is ListOfString



;; =================
;; Functions:

;PROBLEM:
;
;Design a function that consumes a list of strings and "yells" each word by 
;adding "!" to the end of each string.

;; ListOfString -> ListOfString
;; Produce a ListOfString with "!" appended to each string
(check-expect (yell-all empty) empty)
(check-expect (yell-all (cons "hello" empty)) (cons "hello!" empty))
(check-expect (yell-all (cons "hello" (cons "bye" empty))) (cons "hello!" (cons "bye!" empty)))

;(define (yell-all los) los)   ; stub

(define (yell-all los) 
  (cond [(empty? los) empty]
        [else
         (cons (string-append (first los) "!")
               (yell-all (rest los)))]))
