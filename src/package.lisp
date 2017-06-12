(in-package #:cl-user)


(defpackage :docstample
  (:use #:common-lisp #:serapeum #:alexandria #:iterate)
  (:shadowing-import-from #:iterate #:collecting #:summing #:in)
  (:export
   #:<mechanics>
   #:<function>
   #:<generic>
   #:<class>
   #:<macro>

   #:set-documentation
   #:fundamental-accumulator
   #:make-accumulator
   #:generate-documentation-string

   #:generic-node
   #:operator-node
   #:function-node
   #:class-node
   #:macro-node
   #:fundamental-accumulator
   #:fundamental-node))
