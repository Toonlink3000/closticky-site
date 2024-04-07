(in-package #:blogee)

(defwidget wlogin-screen ()
  ((password
    :initarg :password )
   (auth-p
    :initform nil)
   (parent
    :initarg :parent)))

(defun make-login-screen (password parent)
  (make-instance 'wlogin-screen
		 :password password
		 :parent parent))

(defmethod render ((login-screen wlogin-screen))
  (with-html
    (:h1 "Zadej Administrátorské heslo: ")
    (with-html-form (:POST (lambda (&key password &allow-other-keys)
			     (when (equal password (slot-value login-screen 'password))
			       (setf (slot-value login-screen 'auth-p) t))
			     (update (slot-value login-screen 'parent))))
      (:input :type "password"
	      :name "password")
      (:button :type "submit" "Přihlásit se"))))
