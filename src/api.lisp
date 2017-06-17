(in-package #:docstample)


(def <function> (make-instance 'function-node))
(def <generic> (make-instance 'generic-node))
(def <class> (make-instance 'class-node))
(def <macro> (make-instance 'macro-node))


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
