(in-package #:blogee)

(defwidget wfooter ()
  ((text
    :initarg :text
    :initform "Undefined")))

(defun make-footer (text)
  (make-instance 'wfooter :text text))

(defmethod render ((footer wfooter))
  (with-html
    (:h4 (slot-value footer 'text))))
