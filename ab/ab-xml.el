(ab:add-load-path "nxml-mode")
(require 'nxml-mode)
(load "nxml-mode/rng-auto.el")

(let ((extensions '("xml" "xsd" "sch" "rng" "xslt" "svg" "rss")))
  (add-to-list 'auto-mode-alist
               (cons (concat "\\." (regexp-opt extensions t) "\\'") 
                     'nxml-mode)))

(unify-8859-on-decoding-mode)

(add-to-list 'magic-mode-alist '("<\\?xml " . nxml-mode))

(fset 'html-mode 'nxml-mode)

(provide 'ab-xml)