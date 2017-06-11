(in-package #:docstample)


(defvar <function> (make-instance 'function-node))
(defvar <generic> (make-instance 'generic-node))
(defvar <class> (make-instance 'class-node))


(defun set-documentation (symbol generator type accumulator &rest forms)
  (setf (documentation symbol (read-symbol type))
        (generate-documentation-string generator
                                       type
                                       (make-string-output-stream)
                                       forms))
  (unless (null accumulator)
    (accumulate-node accumulator symbol type forms))
  nil)


(defalias make-accumulator
  (curry #'make 'categorized-accumulator))
