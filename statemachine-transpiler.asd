(defsystem :statemachine-transpiler
  :depends-on (:loops :alexandria :rp-parser :rephrase2)
  :around-compile (lambda (next)
                    (proclaim '(optimize (debug 3)
                                         (safety 3)
                                         (speed 0)))
                    (funcall next))
  :components ((:module "source"
                        :pathname "./"
                        :components ((:file "package")
				     (:static-file "statemachine-transpiler.rpa")
                                     (:file "test" :depends-on ("package" "statemachine-transpiler.rpa"))
				     (:file "create-sm-lisp" 
					    :depends-on ("package" "statemachine-transpiler.rpa"))))))


(defsystem :statemachine-transpiler/transpiled
  :depends-on (:loops :alexandria :rp-parser :rephrase2)
  :around-compile (lambda (next)
                    (proclaim '(optimize (debug 3)
                                         (safety 3)
                                         (speed 0)))
                    (funcall next))
  :components ((:module "source"
                        :pathname "./"
                        :components ((:file "package")
				     (:file "sm" :depends-on ("package"))))))


