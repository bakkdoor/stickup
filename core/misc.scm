(define (inspect obj)
  (callm inspect obj))

(define (> obj1 obj2)
  (callm > obj1 obj2))

(define (< obj1 obj2)
  (callm < obj1 obj2))

(define (pp obj)
  (callm pp PP obj))

(define (string obj)
  (callm to_s obj))

(define (class obj)
  (callm class obj))