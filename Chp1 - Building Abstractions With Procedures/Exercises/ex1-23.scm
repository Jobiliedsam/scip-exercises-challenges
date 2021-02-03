;basic procedure
(define (square x) (* x x))

(define (divides? number divisor)
    (= (remainder number divisor) 0))

(define (odd-adjustment number)
    (if (= (remainder number 2) 0)
        (+ number 1)
        number))

(define (runtime) (current-inexact-milliseconds))

;primality procedure
(define (primes? number)
    (define (find-divisor divisor)
        (cond ((> (square divisor) number) number)
            ((divides? number divisor) divisor)
            ((= divisor 2) (find-divisor (+ divisor 1)))
            (else (find-divisor (+ divisor 2)))))
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

(define (search-for-primes number quantity)
    (define (search-iter number count)
        (cond ((and (<= count quantity) (timed-prime-test number)) 
                (search-iter (+ number 2) (+ count 1)))
            ((<= count quantity)(search-iter (+ number 2) count))))
    (search-iter (odd-adjustment number) 1))