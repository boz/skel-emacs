;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!

(defvar ab:*autosave-dir* (expand-file-name "~/.emacs.tmp/"))

(make-directory ab:*autosave-dir* t)

(setq backup-directory-alist (list (cons "." ab:*autosave-dir*)))

(defun ab:save-if-file (&optional args)
  (interactive)
  (if (buffer-file-name)
      (apply #'save-buffer args)))

(add-hook 'auto-save-hook 'ab:save-if-file)

(provide 'ab-autosave)
