(require 'cl)

(defun ab:interleave (c lst)
  (let (ret)
    (dolist (x lst (cdr (reverse ret)))
      (setf ret (cons x (cons c ret))))))

(defun ab:path-join (&rest args)
  (apply #'concat (ab:interleave "/" args)))

(defvar ab:*skel-basedir* 
  (expand-file-name "~/skel/emacs"))

(defvar ab:*custom-file*
  (ab:path-join ab:*skel-basedir* "custom.el"))

(defvar ab:*thirdparty-dir*
  (ab:path-join ab:*skel-basedir* "thirdparty"))

(defvar ab:*config-dir*
  (ab:path-join ab:*skel-basedir* "ab"))

(defvar ab:*global-configs*
  '(global autosave ido theme magit tramp))

(defvar ab:*lang-configs*
  '(lisp
    ruby
    xml
    html))

;; bootstrap environment
(load ab:*custom-file*)
(setq custom-file ab:*custom-file*)
(add-to-list 'load-path ab:*thirdparty-dir*)
(add-to-list 'load-path ab:*config-dir*)

(defun ab:add-load-path (p)
 (let ((path (ab:path-join ab:*thirdparty-dir* p)))
  (if (file-exists-p path) 
      (add-to-list 'load-path path))))

(defun ab:require (name)
  (let ((pkg (format "ab-%s" name)))
       (message "loading ab-%s..." name)
       (require (intern pkg))))

(defun ab:load-thirdparty (p)
  (load (ab:path-join ab:*thirdparty-dir* p)))

(dolist (x ab:*global-configs*)
  (ab:require x))

(dolist (x ab:*lang-configs*)
  (ab:require x))
