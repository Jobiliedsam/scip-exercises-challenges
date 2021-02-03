;remainder of integer division (mod)
(define (remainder dividend divider)
    (cond ((< dividend divider) dividend)
        (else (remainder (- dividend divider) divider))))

;even or odd
(define (even? number)
    (= (remainder number 2) 0))

(define (odd? number)
    (not (= (remainder number 2) 0)))