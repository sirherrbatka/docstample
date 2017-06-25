(in-package #:docstample)



(defmethod query-node ((accumulator categorized-accumulator) type id)
  (let ((package (symbol-package id)))
    (when-let ((packages-table (gethash package
                                        (read-documented-elements accumulator))))
      (when-let ((types-table (gethash type
                                       packages-table)))
        (gethash id types-table)))))


(defmethod accumulate-node ((accumulator categorized-accumulator)
                            name
                            (type fundamental-node)
                            (forms list))
  (let* ((symbol (if (symbolp name) name (second name)))
         (package (~> symbol symbol-package package-name))
         (packages-table (ensure
                             (gethash package
                                      (read-documented-elements accumulator))
                           (make-hash-table :test 'equal)))
         (types-table (ensure (gethash type packages-table)
                        (make-hash-table :test 'equal))))
    (setf (gethash (~> symbol symbol-name) types-table)
          (make-accumulated-node name type forms))))


(defmethod generate-documentation-string ((generator fundamental-generator)
                                          (type fundamental-node)
                                          (output fundamental-output)
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
