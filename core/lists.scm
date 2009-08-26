(define (car list)
  (callm first list))

(define (first list)
  (callm first list))

(define (cdr list)
  (callm rest list))

(define (rest list)
  (callm rest list))

(define (reduce fn base-value list)
  (if (empty? list)
      base-value
      (fn (car list)
	  (reduce fn base-value (cdr list)))))

(define (length list)
  (callm length list))

(define (any? pred-fn list)
  (reduce or #f (map pred-fn list)))

(define (all? pred-fn list)
  (reduce and #t (map pred-fn list)))