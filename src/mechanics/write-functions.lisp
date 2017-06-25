(in-package #:docstample.mechanics)


(defun mechanics-format-syntax (output syntax)
  (if (listp syntax)
      (format output "~%Syntax~%~{ ~a~%~}~%" syntax)
      (format output "~%Syntax~% ~a~%~%" syntax)))


(defun mechanics-format-arguments-and-values (output arguments-and-values)
  (format output "~%Arguments and Values~%")
  (dolist (arg arguments-and-values)
    (format output " ~:@(~a~) -- ~a~%" (first arg) (second arg)))
  (format output "~%"))


(defun mechanics-generate-class-documentation-string (output &key
                                                               description
                                                               construction
                                                               notes)
  (unless (null description)
    (mechanics-format-description output description))
  (unless (null construction)
    (mechanics-format-construction output construction))
  (unless (null notes)
    (mechanics-format-notes output notes))
  (get-output-stream-string output))


(defun mechanics-format-examples (output examples)
  (format output "~%Examples~%")
  (dolist (example examples)
    (format output " ~(~a~) -> ~{~a ~}~%"
            (first example)
            (rest example)))
  (format output "~%"))


(defun mechanics-format-side-effects (output examples)
  (format output "~%Side Effects~% ~a~%~%"
          (or examples "None.")))


(defun mechanics-format-notes (output notes)
  (format output "~%Notes~%~{ ~a~%~}~%" (if (listp notes) notes (list notes))))


(defun mechanics-format-exceptional-situations (output exceptional-situations)
  (format output "~%Exceptional Situations~% ~{~a~%~}~%"
          (if (listp exceptional-situations)
              exceptional-situations
              (list exceptional-situations))))


(defun mechanics-format-description (output description)
  (format output "~%Description~% ~a~%~%" description))


(defun mechanics-format-returns (output returns)
  (if (listp returns)
      (progn
        (format output "~%Returns following values~%")
        (iterate
          (for i from 1)
          (for val in returns)
          (format output " ~a -- ~a~%" i val))
        (format output "~%"))
      (format output "~%Returns: ~a~%" returns)))


(defun mechanics-format-construction (output construction)
  (format output "~%Construct~% ~a~%~%" construction))


(defun mechanics-generate-class-documentation-string (output &key
                                                               examples
                                                               description
                                                               exceptional-situations
                                                               notes)
  (let ((output (read-stream output)))
    (unless (null description)
      (mechanics-format-description output description))
    (unless (null examples)
      (mechanics-format-examples output examples))
    (unless (null notes)
      (mechanics-format-notes output notes))
    (unless (null exceptional-situations)
      (mechanics-format-exceptional-situations output exceptional-situations))))
