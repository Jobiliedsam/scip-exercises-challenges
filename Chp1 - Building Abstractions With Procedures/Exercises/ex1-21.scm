;Testing smallest-divisor for numbers 199, 1999, 19999
(define (smallest-divisor number)
     (find-divisor number 2))
 
(define (find-divisor number divisor) 
     (cond ((> (square divisor) number) number)
         ((divides? number divisor) divisor)
         (else (find-divisor number (+ divisor 1)))))

(define (square x) (* x x))

(define (divides? number divisor)
     (= (remainder number divisor) 0))


;Block Structure form
; (define (smallest-divisor number)
;     (define (find-divisor divisor)
;         (cond ((> (square divisor) number) number)
;             ((divides? divisor) divisor)
;             (else (find-divisor (+ divisor 1)))))
;     (define (square divisor) (* divisor divisor))
;     (define (divides? divisor)
;         (= (remainder number divisor) 0))
;     (find-divisor 2))