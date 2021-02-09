;basic procedure
(define (square x) (* x x))

(define (divides? number divisor)
    (= (remainder number divisor) 0))

(define (odd-adjustment number)
    (if (= (remainder number 2) 0)
        (+ number 1)
        number))

;If using Racket to run Scheme, remove the comment mark from the line below.
;(define (runtime) (current-inexact-milliseconds))

(define (adjustment-divisor number)
    (if (= number 2) 
        (+ number 1)
        (+ number 2)))

;primality procedure
(define (primes? number)
    (define (find-divisor divisor)
        (cond ((> (square divisor) number) number)
            ((divides? number divisor) divisor)
            (else (find-divisor (+ divisor 1)))))
    (define (smallest-divisor)
        (find-divisor 2))
    (= (smallest-divisor) number))

;timed test
(define (timed-prime-test number)
    (start-prime-test number (runtime)))

(define (start-prime-test number start-time)
    (if (primes? number)
        (report-prime (- (runtime) start-time) number)
        #f))

(define (report-prime elapsed-time number)
    (newline)
    (display number)
    (display " *** ") 
    (display elapsed-time)
    (display " milliseconds"))

;Search an especifc quantity of prime numbers after number 
(define (search-for-primes number quantity)
    (define (search-iter number count)
        (cond ((and (<= count quantity) (timed-prime-test number)) 
                (search-iter (+ number 2) (+ count 1)))
            ((<= count quantity)(search-iter (+ number 2) count))))
    (search-iter (odd-adjustment number) 1))