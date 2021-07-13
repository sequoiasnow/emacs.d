;; Make meta key work properly.
(setq mac-option-key-is-meta t
      mac-option-modifier 'meta)

;; Make the MAC / WINDOWS key super
(setq mac-command-modifier 'super)

;; Set the eshell command prompt
(setq eshell-prompt-regexp "^[^λ]+ λ ")

;; Word wrap lines by default
(setq-default word-wrap t)

;; Some more space for editing
(setq-default line-spacing 5)

;; Set the default line length
(setq-default fill-column 80)
(add-hook 'prog-mode-hook 'turn-on-auto-fill)

;; Just treat the mac command key as a meta key.
;; (setq mac-command-modifier 'meta)

;; Remove trailing whitespaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'core-editing)
