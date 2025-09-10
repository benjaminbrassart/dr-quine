#!/usr/bin/emacs -x

;; Emacs Lisp, yikes
(defun colleen (fmt)
  (princ (format fmt 10 34 fmt)))

(defun main ()
  ;; Usually no main function in Lisp.
  (let* ((fmt "#!/usr/bin/emacs -x%1$c%1$c;; Emacs Lisp, yikes%1$c(defun colleen (fmt)%1$c  (princ (format fmt 10 34 fmt)))%1$c%1$c(defun main ()%1$c  ;; Usually no main function in Lisp.%1$c  (let* ((fmt %2$c%3$s%2$c))%1$c    (colleen fmt)))%1$c%1$c(main)%1$c"))
    (colleen fmt)))

(main)
