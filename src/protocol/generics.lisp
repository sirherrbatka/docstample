(in-package #:docstample)


(defgeneric generate-documentation-string (generator type output data))


(defgeneric get-visiting-order (plist-visitor type)
  (:method-combination list))


(defmethod get-visiting-order :around ((plist-visitor fundamental-plist-visitor)
                                       (type fundamental-node))
  (~>> (call-next-method)
       reverse
       (apply #'append)
       remove-duplicates))


(defgeneric get-visitor (generator))


(defgeneric visit (visitor type symbol data output))


(defgeneric output-to-string (output))
