(if (boz:add-path "clojure-mode")
    (progn 
     (require 'clojure-mode)
     (boz:add-auto-mode "\\.clj$" clojure-mode))
    (message "clojure-mode disabled"))

