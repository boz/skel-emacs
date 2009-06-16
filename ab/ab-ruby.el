(require 'ruby-mode)
(require 'inf-ruby)

;; (defun ab:ruby-mode-hook ()
;;   (inf-ruby-keys))

(add-hook 'ruby-mode-hook 'inf-ruby-keys)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

(setq ruby-deep-indent-paren '(?\( t))

;; http://groups.google.com/group/emacs-on-rails/browse_thread/thread/0ae87fc797822bf3
(unless (fboundp 'ruby-insert-end)
  (defun ruby-insert-end ()
    "Insert \"end\" at point and reindent current line."
    (interactive)
    (insert "end")
    (ruby-indent-line t)
    (end-of-line)))

(provide 'ab-ruby)
