(in-package #:blogee)

(mito:deftable tblog ()
  ((title :col-type (:varchar 255))
   (content :col-type (:varchar 1800))))

(defun start-database ()
  (mito:connect-toplevel :sqlite3 :database-name #P"data.db")
  (mito:ensure-table-exists 'tblog))

(defun stop-database ()
  (mito:disconnect-toplevel))
