(in-package #:cl-user)


(defpackage :docstample
  (:use #:common-lisp #:serapeum #:alexandria #:iterate)
  (:shadowing-import-from #:iterate #:collecting #:summing #:in)
  (:export
   #:<mechanics>
   #:<function>
   #:<generic>
   #:<class>
   #:<struct>
   #:<macro>

   #:fundamental-accumulator
   #:fundamental-generator
   #:fundamental-plist-visitor

   #:set-documentation
   #:make-accumulator
   #:generate-documentation-string
   #:query-node
   #:read-symbol
   #:get-visiting-order
   #:visit
   #:get-visitor
   #:read-stream

   #:generic-node
   #:operator-node
   #:function-node
   #:record-node
   #:class-node
   #:struct-node
   #:macro-node
   #:fundamental-output
   #:stream-output
   #:fundamental-accumulator
   #:fundamental-node
   #:fundamental-plist-visitor
   #:accumulated-node
   #:access-name
   #:access-type
   #:access-forms))
