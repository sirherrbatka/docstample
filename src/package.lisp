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
   #:query-node
   #:read-symbol
   #:get-visiting-order
   #:visit
   #:get-visitor

   #:generic-node
   #:operator-node
   #:function-node
   #:class-node
   #:macro-node
   #:fundamental-output
   #:stream-output
   #:fundamental-accumulator
   #:fundamental-node
   #:fundamental-plist-visitor
   #:accumulated-node
   #:access-symbol
   #:access-type
   #:access-forms))
