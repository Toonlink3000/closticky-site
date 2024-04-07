(in-package #:blogee)
;; application settings globals

(defparameter *global-header*
  (make-header "CLOS-tičky" "nil"
	       `("Domů" "/"
		 "Blog" "/blog/"
		 "Galerie" "/gallery/")))

(defparameter *global-footer*
  (make-footer "Copyright CLOS-tičky.cz s.r.o 2024 | Made by Daniel Coats (odnd.cz) | Made in Common Lisp (common-lisp.net)"))

(defparameter *global-styler*
  (make-styler :global "resources/style.css"))

(defparameter *bubble-clients*
  (make-bubble-list '(:relative "resources" "clients")))
