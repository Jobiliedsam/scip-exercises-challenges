;A very old algorithm for find an approximation the square root of some number x.
; Step 1 - Make a Guess.
; Step 2 - Improve the guess by averaging Guess and Number/Guess
; Step 3 - Keep improving the guess until it is good enough

;Basic procedures 
(define (square number)
    (* number number))

(define (abs number)
    (if (< number 0)
        (- number)
        number))

;Algorithm procedures

;Improve guess by averaging 
(define (improve number guess)
    (/ 
        (+ guess (/ number guess))
        2))

;In this case good-enough? captures the micro-evolution between current guess and next improved guess
;Verifying if this evolution is as close to zero as possible.
(define (good-enough? number guess)
    (= (abs (- (improve number guess) guess)) 0.0))

; 
(define (sqrt-iter number guess)
    (if (good-enough? number guess)
        guess
        (sqrt-iter number (improve number guess)))) ; Keeping improving

(define (square-root number)
    (sqrt-iter number 1.0))
