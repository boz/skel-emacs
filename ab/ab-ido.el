(require 'ido)
(ido-mode t)
(setq ido-execute-command-cache nil)
(setq ido-enable-flex-matching t)

(defun ab:ido-execute-command ()
   (interactive)
   (call-interactively
    (intern
     (ido-completing-read
      "M-x "
      (progn
        (unless ido-execute-command-cache
          (mapatoms
           (lambda (s)
             (when (commandp s)
               (setq ido-execute-command-cache
                     (cons (format "%S" s) ido-execute-command-cache))))))
        ido-execute-command-cache)))))

(global-set-key "\M-x" 'ab:ido-execute-command)

(provide 'ab-ido)

