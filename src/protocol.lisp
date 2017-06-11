(in-package #:docstample)

(defparameter *generator* <mechanics>)

(defun foo (a b c))


(defvar *accumulator* (make 'categorized-accumulator))


(set-documentation 'foo *generator* <function> *accumulator*
  :arguments-and-values '(("a" "parameter a")
                          ("b" "parameter b")
                          ("c" "parameter c"))
  :examples '(((foo 1 2 3) t)
              ((foo 12 8 9) nil))
  :returns '("something" "other thing")
  :description "This is example function that does nothing worth of notice."
  :notes '("may signal something if something"
           "will signal other thing"))
