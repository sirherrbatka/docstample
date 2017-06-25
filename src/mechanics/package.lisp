(in-package #:cl-user)


(defpackage :docstample.mechanics
  (:use #:common-lisp #:serapeum #:alexandria #:iterate
        #:docstample)
  (:shadowing-import-from #:iterate #:collecting #:summing #:in)
  (:export
   #:<mechanics>
   #:mechanics-generator
   #:mechanics-visitor))
