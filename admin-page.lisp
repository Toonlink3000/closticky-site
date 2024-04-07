(in-package #:blogee)

(defapp admin-page
  :prefix "/admin/")

(defwidget wadmin-page ()
  ((login
    :initarg :login
    :initform nil)
   (creator
    :initarg :creator)))

(defun make-admin-page ()
  (let ((inst (make-instance 'wadmin-page
			:creator (make-blogpost-creator))))
    (setf (slot-value inst 'login) (make-login-screen "helloworld" inst))
    inst))

(defmethod render ((wadmin-page wadmin-page))
  (with-html
    (render *global-styler*)
    (with-slots (login creator) wadmin-page
      (:div :class "center-box"
	    (if (eql (slot-value login 'auth-p) t)
		(progn
		  (:h1 :class "wadmin-page-title" "Administrační panel")
		  (render creator))
		(progn
		  (render login)))))))

(defmethod reblocks/page:init-page ((admin-page admin-page) url-path expire-at)
  (make-admin-page))
