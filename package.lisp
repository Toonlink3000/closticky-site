(defpackage #:blogee
  (:nicknames #:blog)
  (:use #:cl
	#:reblocks-ui/form
	#:reblocks/html)
  (:import-from #:reblocks/widget
		#:render
		#:update
		#:defwidget)
  (:import-from #:reblocks/actions
		#:make-js-action)
  (:import-from #:reblocks/app
		#:defapp)
  (:import-from #:reblocks/dependencies
	       #:make-dependency
	       #:get-dependencies))
