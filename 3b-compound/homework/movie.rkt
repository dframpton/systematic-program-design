;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname movie) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; movie.rkt

;; =================
;; Data definitions:

;PROBLEM A:
;
;Design a data definition to represent a movie, including  
;title, budget, and year released.
;
;To help you to create some examples, find some interesting movie facts below: 
;"Titanic" - budget: 200000000 released: 1997
;"Avatar" - budget: 237000000 released: 2009
;"The Avengers" - budget: 220000000 released: 2012
;
;However, feel free to resarch more on your own!

(define-struct movie (title budget released))

;; Movie is (make-movie String Integer Integer)
;; interp. (make-movie title budget released) -- improve?
(define M1 (make-movie "Titanic" 200000000 1997))
(define M2 (make-movie "Avatar" 237000000 2009))
(define M3 (make-movie "The Avengers" 220000000 2012))

#;
(define (fn-for-movie m)
  (... (movie-title m)        ; String
       (movie-budget m)       ; Integer
       (movie-released m)))   ; Integer

;; Template rules used:
;;  - compound: 3 fields



;; =================
;; Functions:

;PROBLEM B:
;
;You have a list of movies you want to watch, but you like to watch your 
;rentals in chronological order. Design a function that consumes two movies 
;and produces the title of the most recently released movie.
;
;Note that the rule for templating a function that consumes two compound data 
;parameters is for the template to include all the selectors for both 
;parameters.

;; Movie Movie -> String
;; Given two movies, produce the title of the most recently released movie
(check-expect (newest-movie M1 M2) "Avatar")
(check-expect (newest-movie M2 M3) "The Avengers")
(check-expect (newest-movie M1 (make-movie "The Fifth Element" 90000000 1997)) "Titanic")

;(define (newest-movie m1 m2) "")   ; stub

;<use template from Movie>

(define (newest-movie m1 m2)
  (if (>= (movie-released m1) (movie-released m2))
      (movie-title m1)
      (movie-title m2)))
