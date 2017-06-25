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
               (:module "protocol"
                :components ((:file "classes")
                             (:file "generics")
                             (:file "common")))
               (:module "api"
                :components ((:file "api")))
               (:module "mechanics"
                :components ((:file "package")
                             (:file "write-functions")
                             (:file "classes")
                             (:file "variables")
                             (:file "methods")
                             (:file "mechanics")))))

