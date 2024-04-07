(in-package #:blogee)

(defwidget wblogpost-creator ()
  ((status
    :initform nil)))

(defun make-blogpost-creator ()
  (make-instance 'wblogpost-creator))

(defmethod render ((blogpost-creator wblogpost-creator))
  (with-html-form (:POST (lambda (&key title content &allow-other-keys)
			   (mito:create-dao 'tblog :title title :content content)
			   (update blogpost-creator)))
    (:label :for "wblogpost-creator-title-box" "Titulek blogpostu: ")
    (:input :type "text"
	    :id "wblogpost-creator-title-box"
	    :name "title"
	    :placeholder "Titulek")
    (:br)
    (:label :for "wblogpost-creator-content-box")
    (:textarea :name "content"
	       :id "wblogpost-creator-content-box"
	       :placeholder "Text sem.")
    (:br)
    (:button :type "submit" "Vytvořit blogpost")))
