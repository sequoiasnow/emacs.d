;; Make meta key work properly.
(setq mac-option-key-is-meta t
      mac-option-modifier 'meta)

;; Set the eshell command prompt
(setq eshell-prompt-function
      (lambda () "λ "))

(provide 'core-editing)
