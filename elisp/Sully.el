#!/usr/bin/emacs -x

(setq quine/i 5)
(defmacro quine/format (i)
  `(format quine/format-string 10 34 quine/format-string ,i))
(setq quine/format-string
      "#!/usr/bin/emacs -x%1$c%1$c(setq quine/i %4$d)%1$c(defmacro quine/format (i)%1$c  `(format quine/format-string 10 34 quine/format-string ,i))%1$c(setq quine/format-string%1$c      %2$c%3$s%2$c)%1$c%1$c(unless (< quine/i 0)%1$c  (let ((child-name (format %2$cSully_%%d.el%2$c quine/i))%1$c        (new-i (- quine/i 1)))%1$c%1$c    (write-region%1$c     (quine/format new-i)%1$c     nil%1$c     child-name)%1$c%1$c    (unless (< quine/i 1)%1$c      (call-process %2$cemacs%2$c nil nil nil %2$c-x%2$c child-name))))%1$c")

(unless (< quine/i 0)
  (let ((child-name (format "Sully_%d.el" quine/i))
        (new-i (- quine/i 1)))

    (write-region
     (quine/format new-i)
     nil
     child-name)

    (unless (< quine/i 1)
      (call-process "emacs" nil nil nil "-x" child-name))))
