;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname image-list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; image-list.rkt

(require 2htdp/image)



;; =================
;; Data definitions:

;PROBLEM A:
;
;Design a data definition to represent a list of images. Call it ListOfImage.

;; ListOfImage is one of:
;;  - empty
;;  - (cons Image ListOfImage)
;; interp. a list of images
(define LOI1 empty)
(define LOI2 (cons (square 20 "solid" "red")
                   (cons (rectangle 35 60 "solid" "blue")
                         empty)))

#;
(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]
        [else
         (... (first loi)
              (fn-for-loi (rest loi)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Number ListOfNumber)
;;  - self-reference: (rest lon) is ListOfNumber



;; =================
;; Functions:

;PROBLEM B:
;
;Design a function that consumes a list of images and produces a number 
;that is the sum of the areas of each image. For area, just use the image's 
;width times its height.

;; ListOfImage -> Natural
;; Produce the sum of the area of each image in the given list
(check-expect (sum-area LOI1) 0)
(check-expect (sum-area LOI2)
              (+ (* 20 20) (* 35 60)))

;(define (sum-area loi) 0)   ; stub

(define (sum-area loi)
  (cond [(empty? loi) 0]
        [else
         (+ (* (image-width (first loi))
               (image-height (first loi)))
            (sum-area (rest loi)))]))
