(ab:add-load-path "slime")
(ab:add-load-path "slime/contrib")

(require 'cl)
(require 'ab-util)
(require 'paredit)
(require 'slime)
(require 'highlight-parentheses)

(defvar slime-enabled-contribs
  '(slime-editing-commands
    slime-asdf
    slime-banner
    slime-fuzzy
    slime-presentations
    slime-autodoc
    slime-xref-browser
    slime-references
    slime-scratch
    slime-repl
    slime-clipboard))

(dolist (c slime-enabled-contribs)
  (require c)
  (let ((init (intern (format "%s-init" c))))
    (when (fboundp init)
      (funcall init))))

;; http://sugarshark.com/elisp/init/lisp.el.html
(defun ab:mark-list (&optional arg)
  "Repeatedly select ever larger balanced expressions around the cursor.
Once you have such an expression marked, you can expand to the end of
the following expression with \\[mark-sexp] and to the beginning of the
previous with \\[backward-sexp]."
  (interactive "p")
  (condition-case c
      (progn        (backward-up-list arg)
        (let ((end (save-excursion (forward-sexp) (point))))
          (push-mark end nil t)))
    (scan-error (mark-sexp))))

(defun ab:close-parenthesis ()
  "Continuously reindent the current function"
  (interactive)
  (slime-reindent-defun)
  (paredit-close-parenthesis))

(defun ab:close-parenthesis-and-newline ()
  (interactive)
  (slime-reindent-defun)
  (paredit-close-parenthesis-and-newline))

(defun ab:lisp-mode-hook ()
  (paredit-mode +1)
  (highlight-parentheses-mode t)
  (set-fill-column 80)
  (auto-fill-mode t))

(add-hook 'slime-mode-hook      'ab:lisp-mode-hook)
(add-hook 'slime-repl-mode-hook 'ab:lisp-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'ab:lisp-mode-hook)

(add-hook 'lisp-mode-hook
          (lambda ()
            (ab:lisp-mode-hook)
            (slime-mode t)))

(defvar ab:lisp-key-bindings
  '(( "M-C-a" . slime-beginning-of-defun)
    ( "M-C-e" . slime-end-of-defun)
    ( "RET"   . paredit-newline)
    ( ")"     . ab:close-parenthesis)
    ( "M-)"   . ab:close-parenthesis-and-newline)
    ( "C-@"   . ab:mark-list)))

(defvar ab:slime-key-bindings
  (append ab:lisp-key-bindings
          '(("TAB"       . slime-complete-symbol)
            ("C-c M-t"   . slime-repl-test-system)
            ("C-c M-S-t" . slime-repl-test/force-system)
            ("C-c M-l"   . slime-repl-load-system)
            ("C-c M-S-l" . slime-repl-load/force-system)
            ("C-c M-s"   . slime-repl-compile-system)
            ("C-c M-S-s" . slime-repl-compile/force-system))))

(ab:add-bindings paredit-mode-map    ab:lisp-key-bindings)
(ab:add-bindings slime-mode-map      ab:slime-key-bindings)
(ab:add-bindings lisp-mode-map       ab:lisp-key-bindings)
(ab:add-bindings emacs-lisp-mode-map ab:lisp-key-bindings)
(ab:add-bindings slime-repl-mode-map ab:slime-key-bindings)

(setq inferior-lisp-program
      "/opt/local/bin/sbcl --noinform"
      lisp-indent-function  'common-lisp-indent-function
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol
      common-lisp-hyperspec-root
      "file:///opt/local/share/doc/lisp/HyperSpec-7-0/HyperSpec/"

      ;; slime-banner.el
      slime-startup-animation t
      slime-header-line-p     nil)

(provide 'ab-lisp)
