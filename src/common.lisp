(in-package #:docstample)


(defclass categorized-accumulator (fundamental-accumulator)
  ((%documented-elements :type hash-table
                         :initform (make-hash-table :test 'equal)
                         :reader read-documented-elements)))


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
         (package (symbol-package symbol))
         (packages-table (ensure
                             (gethash package
                                      (read-documented-elements accumulator))
                           (make-hash-table :test 'eq)))
         (types-table (ensure (gethash type packages-table)
                        (make-hash-table :test 'eq))))
    (setf (gethash name types-table)
          (make-accumulated-node name type forms))))

