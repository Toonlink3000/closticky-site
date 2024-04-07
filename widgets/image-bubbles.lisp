(in-package #:blogee)

(defwidget wimage-bubble ()
  ((image
    :initarg :image
    :initform nil)
   (image-path
    :initarg :image-path
    :initform nil)
   (name
    :initarg :name
    :initform nil)))

(defwidget wimage-bubble-list ()
  ((bubbles
    :initform nil
    :initarg :bubbles)))

(defun make-bubble (image-path)
  (make-instance 'wimage-bubble
		 :image-path image-path
		 :name (pathname-name image-path)
		 :image (concatenate 'string (pathname-name image-path) "." (pathname-type image-path))))

(defun make-bubble-list (bubble-directory)
  (let ((file-bubbles (directory
		       (make-pathname :directory bubble-directory :name :wild :type "jpg")))
	(bubble-list (make-instance 'wimage-bubble-list)))
    (setf (slot-value bubble-list 'bubbles)
	  (loop for image in file-bubbles collect
		(make-bubble image)))
    bubble-list))

(defmethod render ((wimage-bubble-list wimage-bubble-list))
  (with-slots (bubbles) wimage-bubble-list
    (with-html
      (loop for bubble in bubbles do
	    (render bubble)))))

(defmethod render ((wimage-bubble wimage-bubble))
  (with-slots (name image) wimage-bubble
    (with-html
      (:img :src (format nil "/static/jpg/~a" image))
      (:h3 name))))

(defmethod get-dependencies ((wimage-bubble wimage-bubble))
  (with-slots (image image-path) wimage-bubble
   (list
    (make-instance 'reblocks/dependencies:local-dependency
		   :type :jpg
		   :path image-path
		   :cache-in-memory t))))
