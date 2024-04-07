(in-package #:blogee)

(export 'start)
(defun start (port &key (working-directory nil) (interfaces nil))
  (start-database)
  (when working-directory
    (setf *default-pathname-defaults* working-directory))
  (reblocks/debug:off)
  (if (not interfaces)
    (reblocks/server:start :debug nil :port port :disable-welcome-app t)
    (progn
      (loop for inter in interfaces do
	    (reblocks/server:start :debug nil :port port :disable-welcome-app t :interface inter)))))

(export 'start-debug)
(defun start-debug (&key (working-directory nil))
  (start-database)
  (let ((port (find-port:find-port)))
    (when working-directory
      (setf *default-pathname-defaults* working-directory))
    (reblocks/debug:on)
    (reblocks/server:start :port port)))

(export 'stop)
(defun stop ()
  (reblocks/server:stop))

(export 'refresh)
(defun refresh ()
  (reblocks/debug:reset-latest-session))
