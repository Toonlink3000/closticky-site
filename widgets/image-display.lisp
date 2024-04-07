(in-package #:blogee)

(defwidget wimage-display ()
  ((image-pathnames
    :initarg :imgpaths)
   (images
    :initarg :images)))

(defun make-image-display (image-pathname-list)
  (let ((images nil))
    (setf images
	  (loop for pathn in image-pathname-list collect
		(concatenate 'string (pathname-name pathn) "." (pathname-type pathn))))
    (make-instance 'wimage-display :imgpaths image-pathname-list :images images)))

(defmethod render ((image-display wimage-display))
  (with-slots (images) image-display
    (with-html
      (loop for image in images do
	    (:div :class "wimage-display-block"
		  (:a :href (format nil "/static/~a/~a" (pathname-type image) image)
		      (:img :class "wimage-display-block-image" :src (format nil "/static/~a/~a" (pathname-type image) image))))))))

(defmethod get-dependencies ((image-display wimage-display))
  (with-slots (images image-pathnames) image-display
    (format t "doing image depend get... ~a" images)
    (loop for image in images
	  for ipath in image-pathnames collect
				       (cond
					 ((equal (pathname-type ipath) "png")
					  (cl:make-instance 'reblocks/dependencies:local-dependency
							    :type :png
							    :path ipath
							    :route (format nil "/static/gallery/~a" image)
							    :cache-in-memory t))
					 ((equal (pathname-type ipath) "jpg")
					  (cl:make-instance 'reblocks/dependencies:local-dependency
							    :type :jpg
							    :path ipath
							    :route (format nil "/static/gallery~a" image)
							    :cache-in-memory t))))))
