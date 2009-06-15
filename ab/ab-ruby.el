(require 'ruby-mode)
(require 'inf-ruby)

;; (defun ab:ruby-mode-hook ()
;;   (inf-ruby-keys))

(add-hook 'ruby-mode-hook 'inf-ruby-keys)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

(setq ruby-deep-indent-paren '(?\( t))

(provide 'ab-ruby)
