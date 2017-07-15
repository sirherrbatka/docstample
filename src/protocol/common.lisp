(in-package #:docstample)



(defmethod query-node ((accumulator categorized-accumulator) type id)
  (when-let ((types-table (gethash type
                                   (read-documented-elements accumulator))))
    (gethash id types-table)))


(defmethod accumulate-node ((accumulator categorized-accumulator)
                            id
                            (type fundamental-node)
                            (forms list))
  (let* ((types-table (ensure
                          (gethash type (read-documented-elements accumulator))
                        (make-hash-table :test 'equal))))
    (setf (gethash id types-table)
          (make-accumulated-node id type forms))))


(defmethod generate-documentation-string ((generator fundamental-generator)
                                          (type fundamental-node)
                                          output
                                          (forms list))
  (let* ((visitor (get-visitor generator))
         (order (get-visiting-order visitor type)))
    (dolist (item order)
      (let ((f (getf forms item)))
        (unless (null f)
          (visit visitor type item f output)))))
  output)


(defmethod output-to-string ((output stream-output))
  (string-trim '(#\Space #\Newline #\Backspace #\Tab
                 #\Linefeed #\Page #\Return #\Rubout)
               (~> output read-stream get-output-stream-string)))
