(in-package #:blogee)

(defwidget wstyler ()
  ((dark-theme
    :initarg :dark
    :initform nil)
   (light-theme
    :initarg :light
    :initform nil)
   (global-style
    :initarg :global
    :initform nil)))


(defun make-styler (&key (light-theme nil) (dark-theme nil) (global nil))
  (make-instance 'wstyler :dark dark-theme :light light-theme :global global))

(defmethod render ((styler wstyler))
  )

(defmacro grab-css (filename)
  `(make-instance 'reblocks/dependencies:local-dependency
		  :type :css
		  :path ,filename
		  :cache-in-memory t
		  :route (format nil "/static/~a" ,filename)))

(defmethod get-dependencies ((styler wstyler))
  (list
   (with-slots (dark-theme light-theme global-style) styler
     (when dark-theme
       (grab-css dark-theme))
     (when light-theme
       (grab-css light-theme))
     (when global-style
       (grab-css global-style)))))
