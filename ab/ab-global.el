(setq user-mail-address "adam.boz@gmail.com")

(global-font-lock-mode 1) ; turn on syntax highlighting for everything
(setq font-lock-maximum-decoration t)  ; use colours in font lock mode
(setq font-lock-maximum-size nil)      ; trun off limit on font lock mode
(setq transient-mark-mode t)           ; highlight current region
(setq indent-tabs-mode nil)            ; use spaces
(setq-default indent-tabs-mode nil)

;; Global settings
(global-set-key "\e\;"   'comment-region)
(global-set-key "\^X\^B" 'electric-buffer-list)
(global-set-key "\^Xar"  'align-regexp)

; ctrl-k kills whole line if at col 0
(setq-default kill-whole-line t) 

;; yes/now -> y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Remove mousable items
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode   -1))
(if (fboundp 'menu-bar-mode)   (menu-bar-mode   -1))

(provide 'ab-global)
