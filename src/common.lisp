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
                            (symbol symbol)
                            (type fundamental-node)
                            (forms list))
  (let ((package (symbol-name (symbol-package symbol)))
        (type (type-of type)))
    (let* ((packages-table (ensure
                               (gethash package
                                        (read-documented-elements accumulator))
                             (make-hash-table)))
           (types-table (ensure (gethash type packages-table)
                          (make-hash-table :test 'equal))))
      (setf (gethash symbol types-table)
            (make-accumulated-node symbol type forms)))))

