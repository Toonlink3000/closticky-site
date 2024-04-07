(in-package #:blogee)

(defapp gallery-page
  :prefix "/gallery/")

(defwidget wgallery-page ()
  ((image-display
    :initarg :image-display)))

(defun make-gallery-page (image-folder-pathname)
  (let ((image-list nil))
    (setf image-list (directory (make-pathname :directory image-folder-pathname :name :wild :type "png")))
    (setf image-list (concatenate 'list
				  image-list
				  (directory (make-pathname :directory image-folder-pathname :name :wild :type "jpg"))))
    (make-instance 'wgallery-page :image-display (make-image-display image-list))))

(defmethod render ((gallery-page wgallery-page))
  (with-slots (image-display) gallery-page
   (with-html
     (render *global-styler*)
     (render *global-header*)
     (render image-display)
     (render *global-footer*))))

(defmethod reblocks/page:init-page ((gallery-page gallery-page) url-path expire-at)
  (make-gallery-page '(:relative "resources" "gallery")))
