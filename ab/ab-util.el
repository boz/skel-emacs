
(defun ab:add-bindings (map bindings)
  (dolist (b bindings)
    (define-key map (read-kbd-macro (car b)) (cdr b))))

(provide 'ab-util)

