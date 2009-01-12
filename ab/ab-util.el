
(defun boz:add-bindings (map bindings)
  (dolist (b bindings)
    (define-key map (read-kbd-macro (first b)) (second b))))

(defun boz:add-auto-mode (pat mode)
 (add-to-list 'auto-mode-alist (cons pat mode)))

(provide 'ab-util)

