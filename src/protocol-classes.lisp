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

(defclass class-node (fundamental-node)
  ())

(defmethod initialize-instance ((obj function-node) &rest initargs)
  (write-symbol 'function obj)
  (call-next-method))

(defclass generic-node (operator-node)
  ())

(defmethod initialize-instance ((obj generic-node) &rest initargs)
  (write-symbol 'function obj)
  (call-next-method))

(defmethod initialize-instance ((obj class-node) &rest initargs)
  (write-symbol 'class obj)
  (call-next-method))
