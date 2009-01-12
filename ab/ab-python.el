(if (boz:add-path "pymacs")

    (defun py-next-block ()
       "go to the next block.  Cf. `forward-sexp' for lisp-mode"
       (interactive)
       (py-mark-block nil 't)
       (back-to-indentation))

    (add-hook 'python-mode-hook (lambda ()
      (define-key "\C-ca" 'python-beginning-of-block)
      (define-key "\C-ce" 'python-next-block)))

    (require 'python)

    (autoload 'pymacs-apply "pymacs")
    (autoload 'pymacs-call "pymacs")
    (autoload 'pymacs-eval "pymacs" nil t)
    (autoload 'pymacs-exec "pymacs" nil t)
    (autoload 'pymacs-load "pymacs" nil t)

    (eval-after-load "pymacs"
      '(pymacs-load "ropemacs" "rope-")))

