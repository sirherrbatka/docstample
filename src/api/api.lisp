(in-package #:docstample)


(def <function> (make-instance 'function-node))
(def <generic> (make-instance 'generic-node))
(def <class> (make-instance 'class-node))
(def <struct> (make-instance 'struct-node))
(def <macro> (make-instance 'macro-node))

(defvar *accumulate-docs* nil)


(defun set-documentation (symbol generator type accumulator &rest forms)
  (setf (documentation symbol (read-symbol type))
        (~> (generate-documentation-string generator
                                           type
                                           (make 'stream-output)
                                           forms)
            output-to-string))
  (unless (null accumulator)
    (accumulate-node accumulator symbol type forms)
    (when-let ((examples (getf forms :examples)))
      (apply #'accumulate-examples
             accumulator
             (get-object symbol type)
             examples)))
  nil)


(defalias make-accumulator
  (curry #'make 'categorized-accumulator))


(defmacro define-accumulated-docs (name)
  `(defparameter ,name
     (and *accumulate-docs*
          (docstample:make-accumulator))))


(defun enable-docs-accumulation ()
  (setf *accumulate-docs* t))


(defun disable-docs-accumulation ()
  (setf *accumulate-docs* nil))
