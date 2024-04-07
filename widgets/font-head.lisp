(in-package #:blogee)

(defun render-font-head ()
  (with-html
    (:raw "<style>@import url('https://fonts.googleapis.com/css2?family=MuseoModerno:ital,wght@0,100..900;1,100..900&display=swap')</stxyle>")))
