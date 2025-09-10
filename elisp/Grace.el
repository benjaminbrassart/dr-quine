#!/usr/bin/emacs -x

;;;;;;;;;;;;;;;;;
;; One comment ;;
;;;;;;;;;;;;;;;;;

(defmacro quine/format ()
  "#!/usr/bin/emacs -x%1$c%1$c;;;;;;;;;;;;;;;;;%1$c;; One comment ;;%1$c;;;;;;;;;;;;;;;;;%1$c%1$c(defmacro quine/format ()%1$c  %2$c%3$s%2$c)%1$c(defmacro quine/program ()%1$c  (write-region%1$c   (format (quine/format) 10 34 (quine/format))%1$c   nil%1$c   %2$cGrace_kid.el%2$c))%1$c(defmacro quine/main ()%1$c  (quine/program))%1$c%1$c(quine/main)%1$c")
(defmacro quine/program ()
  (write-region
   (format (quine/format) 10 34 (quine/format))
   nil
   "Grace_kid.el"))
(defmacro quine/main ()
  (quine/program))

(quine/main)
