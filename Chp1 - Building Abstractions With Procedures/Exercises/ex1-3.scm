(define (square x) (* x x))

(define (sum-square x y)
    (+ (square x) (square y)))

(define (sum-largest-square x y z)
    (cond ((and (>= x z) (>= y z)) (sum-square x y))
        ((and (>= x y) (>= z y)) (sum-square x z))
        ((and (>= y x) (>= z x)) (sum-square x y))))