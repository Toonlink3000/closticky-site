(in-package #:blogee)

(defwidget wheader ()
  ((site-name
    :initform "UndefinedName"
    :initarg :site-name)
   (icon
    :initform "nil"
    :initarg :icon)
   (navlinks
    :initform '("Home" "/")
    :initarg :navlinks)))

(defun make-header (site-name icon navlinks)
  (make-instance 'wheader :site-name site-name :icon icon :navlinks navlinks))

(defmethod render ((header wheader))
  (with-slots (site-name icon navlinks) header
    (with-html
      (:img :class "wheader-site-icon" :src "/static/png/icon.png")
      (:h1 :class "wheader-site-title" site-name)
      (:div :class "wheader-navbar"
	    (loop for (tx link) on navlinks by #'cddr do
	      (:a :class "wheader-navbar-link" :href link tx))))))


(defmethod get-dependencies ((header wheader))
  (list
   (make-instance 'reblocks/dependencies:local-dependency :type :png :path #P "resources/icon.png" :cache-in-memory t)))
