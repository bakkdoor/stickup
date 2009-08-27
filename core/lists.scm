(define (cadr seq)
  (car (cdr seq)))

(define (caddr seq)
  (car (cdr (cdr seq))))

(define (cadddr seq)
  (car (cdr (cdr (cdr seq)))))

(define (caddddr seq)
  (car (cdr (cdr (cdr (cdr seq))))))

(define (cons elem seq)
  (let ((new-arr (insert! elem [])))
    (if (nil? seq)
        new-arr
        (append! seq new-arr))))

(define (car seq)
  (callm first seq))

(define (first seq)
  (callm first seq))

(define (cdr seq)
  (callm rest seq))

(define (rest seq)
  (callm rest seq))

(define (last seq)
  (callm last seq))

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

(define (count pred-fn seq)
  (length (filter pred-fn seq)))

(define (drop n seq)
  (if (<= n 0)
      seq
      (drop (- n 1) (rest seq))))

(define (drop-while pred-fn seq)
  (if (pred-fn (first seq))
      (drop-while pred-fn (rest seq))
      seq))

(define (take n seq)
  (if (or (<= n 0) (empty? seq))
      '()
      (cons (first seq) (take (- n 1) (rest seq)))))

(define (take-while pred-fn seq)
  (if (pred-fn (first seq))
      (cons (first seq) (take-while pred-fn (rest seq)))
      '()))

(define (filter pred-fn seq)
  (if (empty? seq)
      '()
      (let ((head (first seq))
            (tail (rest seq)))
        (if (pred-fn head)
            (cons head (filter pred-fn tail))
            (filter pred-fn tail)))))

(define (upto m n)
  (if (>= m n)
      '(m)
      (cons m (upto (+ m 1) n))))

(define (split-at n seq)
  '((take n seq) (drop n seq)))

(define (reverse seq)
  (callm reverse seq))

(define (reverse! seq)
  (callm reverse! seq))

(define (remove-if pred-fn seq)
  (filter (lambda (x) (not (pred-fn (x)))) seq))

(define (compact seq)
  (callm compact seq))

(define (pairwise seq1 seq2)
  (callm zip seq1 seq2))

(define (zip seqs)
  (map (lambda (x) (compact (flatten x)))
       (reduce pairwise '() seqs)))

(define (flatten seq)
  (callm flatten seq))

(define (unzip1 seqs)
  (map car seqs))

(define (unzip2 seqs)
  (cons (map car seqs)
        (map cadr seqs)))

(define (unzip3 seqs)
  (cons (map car seqs)
        (map cadr seqs)
        (map caddr seqs)))

(define (unzip4 seqs)
  (cons (map car seqs)
        (map cadr seqs)
        (map caddr seqs)
        (map cadddr seqs)))

(define (unzip5 seqs)
  (cons (map car seqs)
        (map cadr seqs)
        (map caddr seqs)
        (map cadddr seqs)
        (map caddddr seqs)))