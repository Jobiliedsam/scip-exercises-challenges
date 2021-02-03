;Algoritmo para verficiar a quantidade de MIPS do processador

(define (runtime) (current-inexact-milliseconds))

(define (timed-sum a b start-time)
    (define (sum a b)
        (if (= b 0)
            (display (- (runtime) start-time))
            (sum (- a 1) (- b 1))))
    (sum a b))



(define (f a start-time)
    (f-iter a 1 1 (runtime)))

(define (f-iter a b product start-time)
    (if (>= b a) 
        (display product)
        (f-iter a (+ b 1) (* b product) start-time)))


(define (teste time)
    (display (* 218290000000000000000000000000000000000000000000 218290000000000000000000000000000000000000000000000000000000))
    (display "***")
    (display (- (runtime) 1)))