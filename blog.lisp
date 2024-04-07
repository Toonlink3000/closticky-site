(in-package #:blogee)

(defapp blog-page
  :prefix "/blog/")

(defwidget wblog-page ()
  ((bplist
    :initarg :blogpost-list)))

(defun make-blog-page ()
  (make-instance 'wblog-page
		 :blogpost-list (make-blogpost-list "Náš Blog: ")))

(defmethod render ((wblog-page wblog-page))
  (with-slots (bplist) wblog-page
   (with-html
     (render *global-styler*)
     (render *global-header*)
     (render bplist)
     (render *global-footer*))))

(defmethod reblocks/page:init-page ((app blog-page) url-path expire-at)
  (make-blog-page))
