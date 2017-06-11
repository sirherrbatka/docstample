(in-package #:cl-user)


(asdf:defsystem docstample
  :name "docstample"
  :version "0.0.0"
  :license "MIT"
  :author "Lisp Mechanics"
  :maintainer "Lisp Mechanics"
  :depends-on (:iterate :alexandria :serapeum)
  :serial T
  :pathname "src"
  :components ((:file "package")
               (:file "protocol-classes")
               (:file "protocol-generics")
               (:file "common")
               (:file "mechanics")
               (:file "api")))
