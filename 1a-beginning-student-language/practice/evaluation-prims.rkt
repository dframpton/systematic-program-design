;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname evaluation-prims) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; evaluation-prims.rkt

;PROBLEM:
;
;Write out the step-by-step evaluation for the following expression: 
;
;(+ (* 2 3) (/ 8 2))

(+ (* 2 3) (/ 8 2))
(+ 6 (/ 8 2))
(+ 6 4)
10



;PROBLEM:
;
;Write out the step-by-step evaluation for the following expression: 
;
;(* (string-length "foo") 2)

(* (string-length "foo") 2)
(* 3 2)
6
