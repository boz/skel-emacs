(ab:add-load-path "slime")
(ab:add-load-path "slime/contrib")

(require 'cl)
(require 'slime)
(require 'paredit)
(require 'highlight-parentheses)
(require 'slime-editing-commands)
(require 'slime-asdf)
(require 'slime-banner)
(require 'slime-fuzzy)
(require 'slime-presentations)

(defun ab:end-of-defun (&optional arg)
  "Move to end of defun leaving point directly after the closing paren."
  (interactive "p")
  (forward-char 1)
  (end-of-defun arg)
  (backward-char 1))

(defun ab:lisp-mode-hook ()
  (paredit-mode t)
  (highlight-parentheses-mode t)
  (set-fill-column 80)
  (auto-fill-mode t))

(add-hook 'lisp-mode-hook
          (lambda ()
            (ab:lisp-mode-hook)
            (slime-mode t)))

(add-hook 'slime-repl-mode-hook
          #'ab:lisp-mode-hook)

(add-hook 'lisp-mode-hook
          #'ab:lisp-mode-hook)

(defun ab:slime-mode-hook ()
  (ab:lisp-mode-hook))

(add-hook 'slime-mode-hook 'ab:slime-mode-hook)

(defvar ab:lisp-key-bindings
  `(( "M-a" ,#'beginning-of-defun)
    ( "M-e" ,#'ab:end-of-defun)
    ( "RET" ,#'paredit-newline)
    ( "TAB" ,#'slime-complete-symbol)))

(ab:add-bindings slime-mode-map      ab:lisp-key-bindings)
(ab:add-bindings lisp-mode-map       ab:lisp-key-bindings)
;; (ab:add-bindings emacs-lisp-mode-map ab:lisp-key-bindings)
(ab:add-bindings slime-repl-mode-map ab:lisp-key-bindings)

(setq inferior-lisp-program "sbcl"
      lisp-indent-function  'common-lisp-indent-function
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol
      common-lisp-hyperspec-root "file:///opt/local/share/doc/lisp/HyperSpec-7-0/HyperSpec/"
      slime-startup-animation t)

;; ;; http://sugarshark.com/elisp/init/lisp.el.html
;; (defun ab:mark-list (&optional arg)
;;   "Repeatedly select ever larger balanced expressions around the cursor.
;; Once you have such an expression marked, you can expand to the end of
;; the following expression with \\[mark-sexp] and to the beginning of the
;; previous with \\[backward-sexp]."
;;   (interactive "p")
;;   (condition-case c
;;       (progn
;;         (backward-up-list arg)
;;         (let ((end (save-excursion (forward-sexp) (point))))
;;           (push-mark end nil t)))
;;     (scan-error (mark-sexp))))

;; (defun ab:close-defun ()
;;   (interactive)
;;   (slime-close-all-sexp)
;;   (slime-reindent-defun))

;; (defun ab:reformat-defun ()
;;   "Reformat trailing parentheses Lisp-stylishly and reindent toplevel form."
;;   (interactive)
;;   (save-excursion
;;     (ab:end-of-defun)
;;     (ab:close-defun)))
    
;; (defun ab:close-list ()
;;   (interactive)
;;   (condition-case c
;;       (paredit-close-parenthesis)
;;     (scan-error (unless (looking-at "^$")
;;                   (ab:close-defun)
;;                   (reindent-then-newline-and-indent)))))

(provide 'ab-lisp)
