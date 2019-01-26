(asdf:defsystem "apixu"
  :description "Common Lisp APIXU API client"
  :author "Tamas Molnar"
  :version "0.0.1"
  :license "MIT"
  :depends-on ("drakma" "cl-json")
  :components ((:file "api-key")
               (:file "apixu":depends-on ("api-key")))
  #+asdf-unicode :encoding #+asdf-unicode :utf-8)
