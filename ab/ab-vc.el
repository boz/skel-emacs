(require 'vc-git)

(when (featurep 'vc-git)
  (add-to-list 'vc-handled-backends 'git))

(provide 'ab-vc)