;;;; Name:    "Common Lisp APIXU API client"
;;;; Author:  Tamas Molnar - tmolnar0831@gmail.com
;;;; License: MIT

(defpackage :apixu
  (:nicknames :cl-apixu)
  (:use "COMMON-LISP"
        "API-KEY")
  (:export "APIXU-QUERY"
           "COMBINE-URI"))

(in-package :apixu)

(defparameter *version* "0.0.1")
(defvar *api-uri* "https://api.apixu.com")
(defvar *api-version* "1")
(defvar *api-method* "current")
(defvar *api-format* "json")
(defvar *api-key* (load-api-key "apixu"))

(defun aget (alist key) (cdr (assoc key alist)))

(defun combine-uri (&key (api-uri *api-uri*)
                      (api-version *api-version*)
                      (api-method *api-method*)
                      (api-format *api-format*))
  (format nil "~A/v~A/~A.~A" api-uri api-version api-method api-format))

(define-condition apixu-api-error (error)
  ((code :initarg :code :reader apixu-api-error-code)
   (message :initarg :message :reader apixu-api-error-message))
  (:report (lambda (condition stream)
             (write-string (apixu-api-error-message condition) stream))))

(defun apixu-query (location &optional (uri (combine-uri)))
  (let* ((json-response (babel:octets-to-string (drakma:http-request uri
                                                                     :method :get
                                                                     :parameters (list (cons "q" location)
                                                                                       (cons "key" *api-key*)))))
         (lisp-response (with-input-from-string (s json-response) (json:decode-json s))))
    (if (aget lisp-response :error)
        (error 'apixu-api-error
               :code (aget (aget lisp-response :error) :code) 
               :message (aget (aget lisp-response :error) :message))
        lisp-response)))
