(in-package #:cl-user)


(defpackage :docstample
  (:use #:common-lisp #:serapeum #:alexandria #:iterate)
  (:shadowing-import-from #:iterate #:collecting #:summing #:in)
  (:export
   #:<class>
   #:<error>
   #:<function>
   #:<generic>
   #:<macro>
   #:<mechanics>
   #:<struct>
   #:access-forms
   #:access-name
   #:access-type
   #:accumulate-docs
   #:accumulated-node
   #:class-node
   #:condition-node
   #:define-accumulated-docs
   #:disable-docs-accumulation
   #:enable-docs-accumulation
   #:error-node
   #:function-node
   #:fundamental-accumulator
   #:fundamental-accumulator
   #:fundamental-generator
   #:fundamental-node
   #:fundamental-output
   #:fundamental-plist-visitor
   #:fundamental-plist-visitor
   #:generate-documentation-string
   #:generic-node
   #:get-visiting-order
   #:get-visitor
   #:macro-node
   #:make-accumulator
   #:operator-node
   #:query-node
   #:read-stream
   #:read-symbol
   #:record-node
   #:run-examples
   #:set-documentation
   #:stream-output
   #:struct-node
   #:visit))
