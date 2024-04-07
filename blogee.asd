(require 'asdf)

(asdf:defsystem #:blogee
  :depends-on ("reblocks" "reblocks-ui" "find-port" "parenscript" "reblocks-lass" "cl-fad" "mito")
  :serial t
  :components ((:file "package")
	       (:file "database")
	       (:file "widgets/image-bubbles.lisp")
	       (:file "widgets/login-screen.lisp")
	       (:file "widgets/blogpost-creator.lisp")
	       (:file "widgets/blogpost")
	       (:file "widgets/blogpost-list")
	       (:file "widgets/styler")
	       (:file "widgets/header")
	       (:file "widgets/footer")
	       (:file "widgets/image-display")
	       (:file "globals")
	       (:file "hello-page")
	       (:file "blog")
	       (:file "galery")
	       (:file "admin-page")
	       (:file "main")))
