(in-package #:blogee)

(defwidget wblogpost ()
  ((title
    :initarg :title)
   (content
    :initarg :content)))

(defun make-blogpost (title content)
  (make-instance 'wblogpost :title title :content content))

(defmethod render ((blogpost wblogpost))
  (with-slots (title content) blogpost
    (with-html
      (:h2 :class "wblogpost-title" title)
      (:h3 :class "wblogpost-subtitle" "by Admin")
      (:div :class "wblogpost-body" content))))
