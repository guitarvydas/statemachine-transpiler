(in-package :statemachine-transpiler)

(defun create-sm-lisp ()
  (let ((p (make-instance 'rpa:parser)))
    (let ((sm-language-spec (alexandria:read-file-into-string
			     (asdf:system-relative-pathname :statemachine-transpiler "statemachine-transpiler.rpa"))))
      (let ((scanned (rephrase:scanner sm-language-spec)))
        (rp-parser:parse p scanned)
        (let ((sm-language-lisp-str (cl:get-output-stream-string (rpa:output-string-stream p))))
          (with-open-file 
	      (smlisp-file
	       (asdf:system-relative-pathname :statemachine-transpiler "sm.lisp")
	       :direction :output :if-exists :supersede :if-does-not-exist :create)
           (write-string sm-language-lisp-str smlisp-file))))))
  :done)

