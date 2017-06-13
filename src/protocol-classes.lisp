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

(defclass class-node (fundamental-node)
  ())

(defclass accumulated-node ()
  ((%symbol :type symbol
            :initarg :symbol
            :accessor access-symbol)
   (%type :type fundamental-node
          :initarg :type
          :accessor access-type)
   (%forms :type list
           :initarg :forms
           :accessor access-forms)))

(defun make-accumulated-node (symbol type forms)
  (declare (optimize (safety 3)))
  (make 'accumulated-node
        :symbol symbol
        :type type
        :forms forms))

(defmethod initialize-instance ((obj function-node) &rest initargs)
  (write-symbol 'function obj)
  (call-next-method))

(defclass generic-node (operator-node)
  ())

(defmethod initialize-instance ((obj generic-node) &rest initargs)
  (write-symbol 'function obj)
  (call-next-method))

(defmethod initialize-instance ((obj class-node) &rest initargs)
  (write-symbol 'type obj)
  (call-next-method))

(defmethod initialize-instance ((obj macro-node) &rest initargs)
  (write-symbol 'function obj)
  (call-next-method))
