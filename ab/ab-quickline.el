;; http://www.emacswiki.org/cgi-bin/emacs-en/CopyingWholeLines
(defun boz:quick-copy-line ()
  "Copy the whole line that point is on and move to the beginning of the next line.
  Consecutive calls to this command append each line to the kill-ring."
  (interactive)
  (let ((beg (line-beginning-position 1))
        (end (line-beginning-position 2)))
    (if (eq last-command 'quick-copy-line)
        (kill-append (buffer-substring beg end) (< end beg))
      (kill-new (buffer-substring beg end))))
  (beginning-of-line 2))

(defun boz:quick-kill-line ()
  "Kill the current line, regardless of column position."
  (interactive)
  (move-beginning-of-line nil)
  (kill-line))

(defun boz:beginning-of-text-strict ()
  "Move to the first non-space character on the line"
  (interactive)
  (beginning-of-line 1)
  (skip-chars-forward " \t"))

(global-set-key "\e\C-k"     'boz:quick-kill-line)
(global-set-key "\C-x\e\C-k" 'boz:quick-copy-line)
(global-set-key "\C-c\C-a"   'boz:beginning-of-text-strict)

