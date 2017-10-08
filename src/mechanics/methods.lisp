(in-package #:docstample.mechanics)


(defmethod get-visiting-order list ((visitor mechanics-generator-visitor)
                                    (type operator-node))
  '(:syntax :arguments-and-values :examples :description :notes))


(let ((function-stuff '(:returns :side-effects :exceptional-situations)))
  (defmethod get-visiting-order list ((visitor mechanics-generator-visitor)
                                      (type function-node))
    function-stuff)

  (defmethod get-visiting-order list ((visitor mechanics-generator-visitor)
                                      (type generic-node))
    function-stuff))


(defmethod get-visiting-order list ((visitor mechanics-generator-visitor)
                                    (type record-node))
  '(:description))


(defmethod get-visitor ((visitor mechanics-generator))
  <visitor>)


(defmethod generate-documentation-string ((generator mechanics-generator)
                                          (type class-node)
                                          output
                                          (forms list))
  (apply #'mechanics-generate-class-documentation-string
         output
         forms)
  output)


(defmethod visit ((visitor mechanics-generator-visitor)
                  (type record-node)
                  (symbol (eql :description))
                  data
                  (output stream-output))
  (mechanics-format-description (read-stream output) data))


(defmethod visit ((visitor mechanics-generator-visitor)
                  (type operator-node)
                  (symbol (eql :arguments-and-values))
                  data
                  (output stream-output))
  (mechanics-format-arguments-and-values (read-stream output) data))


(defmethod visit ((visitor mechanics-generator-visitor)
                  (type operator-node)
                  (symbol (eql :examples))
                  data
                  (output stream-output))
  (mechanics-format-examples (read-stream output) data))


(defmethod visit ((visitor mechanics-generator-visitor)
                  (type operator-node)
                  (symbol (eql :description))
                  data
                  (output stream-output))
  (mechanics-format-description (read-stream output) data))


(defmethod visit ((visitor mechanics-generator-visitor)
                  (type operator-node)
                  (symbol (eql :exceptional-situations))
                  data
                  (output stream-output))
  (mechanics-format-exceptional-situations (read-stream output) data))


(defmethod visit ((visitor mechanics-generator-visitor)
                  (type operator-node)
                  (symbol (eql :notes))
                  data
                  (output stream-output))
  (mechanics-format-notes (read-stream output) data))


(defmethod visit ((visitor mechanics-generator-visitor)
                  (type operator-node)
                  (symbol (eql :side-effects))
                  data
                  (output stream-output))
  (mechanics-format-side-effects (read-stream output) data))


(defmethod visit ((visitor mechanics-generator-visitor)
                  (type operator-node)
                  (symbol (eql :returns))
                  data
                  (output stream-output))
  (mechanics-format-returns (read-stream output) data))


(defmethod visit ((visitor mechanics-generator-visitor)
                  (type operator-node)
                  (symbol (eql :syntax))
                  data
                  (output stream-output))
  (mechanics-format-syntax (read-stream output) data))

