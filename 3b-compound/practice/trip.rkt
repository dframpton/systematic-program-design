;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname trip) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; trip.rkt

;; =================
;; Data definitions:

;PROBLEM A:
;
;Design a data definition to help travellers plan their next trip. 
;A trip should specify an origin, destination, mode of transport and 
;duration (in days).

(define-struct trip (origin destination transport duration))

;; Trip is (make-trip String String String Integer)
;; interp. a trip with origin, destination, mode of transport, and duration in days.
(define T1 (make-trip "London" "New York" "Flight" 5))
(define T2 (make-trip "London" "Paris" "Train" 3))
(define T3 (make-trip "Southampton" "Antigua" "Boat" 14))
(define T4 (make-trip "London" "Bath" "Car" 3))

#;
(define (fn-for-trip t)
  (... (trip-origin t)        ; String
       (trip-destination t)   ; String
       (trip-transport t)     ; String
       (trip-duration t)))    ; Integer

;; Template rules used:
;;  - compound: 4 fields



;; =================
;; Functions:

;PROBLEM B:
;
;You have just found out that you have to use all your days off work 
;on your next vacation before they expire at the end of the year. 
;Comparing two options for a trip, you want to take the one that 
;lasts the longest. Design a function that compares two trips and 
;returns the trip with the longest duration.
;
;Note that the rule for templating a function that consumes two 
;compound data parameters is for the template to include all 
;the selectors for both parameters.

;; Trip Trip -> Trip
;; Given two trips, produce the trip with the longest duration
(check-expect (longest-trip T1 T2) T1)
(check-expect (longest-trip T1 T3) T3)
(check-expect (longest-trip T2 T4) T4)

;(define (longest-trip t1 t2) t1)   ; stub

;<use template from Trip>

(define (longest-trip t1 t2)
  (if (> (trip-duration t1) (trip-duration t2))
      t1
      t2))
