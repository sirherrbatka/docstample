(in-package #:docstample)


(defclass fundamental-generator ()
  ())


(defclass fundamental-node ()
  ((%symbol :type symbol
            :reader read-symbol
            :writer write-symbol
            :initarg :symbol)))


(defclass fundamental-accumulator ()
  ())


(defclass operator-node (fundamental-node)
  ())


(defclass function-node (operator-node)
  ())


(defclass macro-node (operator-node)
  ())


(defclass record-node (fundamental-node)
  ())


(defclass class-node (record-node)
  ())


(defclass struct-node (record-node)
  ())


(defclass accumulated-node ()
  ((%name :type (or list symbol)
          :initarg :name
          :accessor access-name)
   (%type :type fundamental-node
          :initarg :type
          :accessor access-type)
   (%forms :type list
           :initarg :forms
           :accessor access-forms)))


(defun make-accumulated-node (name type forms)
  (declare (optimize (safety 3)))
  (make 'accumulated-node
        :name name
        :type type
        :forms forms))


(defmethod initialize-instance ((obj function-node) &rest initargs)
  (write-symbol 'function obj)
  (call-next-method))


(defclass generic-node (function-node)
  ())


(defclass fundamental-plist-visitor ()
  ())


(defclass fundamental-output ()
  ())


(defclass stream-output (fundamental-output)
  ((%stream :reader read-stream
            :initform (make-string-output-stream))))


(defmethod initialize-instance ((obj generic-node) &rest initargs)
  (declare (ignore initargs))
  (write-symbol 'function obj)
  (call-next-method))


(defmethod initialize-instance ((obj class-node) &rest initargs)
  (declare (ignore initargs))
  (write-symbol 'type obj)
  (call-next-method))


(defmethod initialize-instance ((obj macro-node) &rest initargs)
  (declare (ignore initargs))
  (write-symbol 'function obj)
  (call-next-method))


(defmethod initialize-instance ((obj struct-node) &rest initargs)
  (declare (ignore initargs))
  (write-symbol 'type obj)
  (call-next-method))


(defclass categorized-accumulator (fundamental-accumulator)
  ((%documented-elements :type hash-table
                         :initform (make-hash-table :test 'equal)
                         :reader read-documented-elements)))
