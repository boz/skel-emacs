
(setq c-mode-hook
      (function (lambda ()
                  (c-set-style "cc-mode"))))

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command 
   (format "find %s -type f -name \"*.[ch]\" | etags -" dir-name)))

(provide 'ab-c)

