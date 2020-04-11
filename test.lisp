(in-package :statemachine-transpiler)

(defun test ()
  (let ((str (alexandria:read-file-into-string 
	      (asdf:system-relative-pathname :statemachine-transpiler "statemachine-transpiler.rpa")))
	(p (make-instance 'rp-parser:parser)))
    (let ((scanned (rephrase:scanner str)))
      (rp-parser:parse p scanned)
      ;; at this point, the output-string-stream contains Lisp code to implement the transpiler for
      ;; the state language (we will use this Lisp code in ../producer-consumer)
      (cl:get-output-stream-string (rp-parser:output-string-stream p)))))

