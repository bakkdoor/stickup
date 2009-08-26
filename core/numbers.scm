(define (zero? x)
  (= x 0))

(define (even? x)
  (= (mod x 2) 0))

(define (odd? x)
  (not (even? x)))

(define (mod x y)
  (callm modulo x y))

(define (sum number-list)
  (reduce + 0 number-list))

(define (product number-list)
  (reduce * 1 number-list))

(define (float x)
  (callm to_f x))

(define (int x)
  (callm to_i x))