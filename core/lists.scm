(define (cons elem list)
  (let ((new-arr (insert! elem (<array>))))
    (if (nil? list)
        new-arr
        (append! list new-arr))))

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

(define (all? pred-fn seq)
  (reduce and #t (map pred-fn seq)))

(define (insert! elem seq)
  (callm << seq elem))

(define (append seq1 seq2)
  (let ((seq-new (array<< seq2)))
    (callm concat seq-new seq1)))

(define (append! seq1 seq2)
  (unless (nil? seq2)
          (callm concat seq2 seq1)))

(define (drop n seq)
  (if (<= n 0)
      seq
      (drop (- n 1) (rest seq))))

(define (take n seq)
  (if (<= n 0)
      '()
      (cons (first seq) (take (- n 1) (rest seq)))))