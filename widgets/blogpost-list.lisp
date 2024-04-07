(in-package #:blogee)

(defwidget wblogpost-list ()
  ((blogposts
    :initform nil
    :initarg :blogposts)
   (title
    :initform "UndefinedSection"
    :initarg :title)))

(defun refresh-blogpost-list (blogpost-list)
  (let ((fetched-posts (mito:select-dao 'tblog)))
    (with-slots (blogposts) blogpost-list
	(setf blogposts
	      (loop for post in fetched-posts collect
		    (with-slots (title content) post
		      (make-blogpost title content)))))
    blogpost-list))

(defun make-blogpost-list (section-title)
  (let ((blist (make-instance 'wblogpost-list :title section-title)))
    (refresh-blogpost-list blist)))

(defmethod render ((blogpost-list wblogpost-list))
  (with-slots (blogposts title) blogpost-list
    (with-html
      (:h1 title)
      (loop for post in blogposts do
	    (render post)))))

