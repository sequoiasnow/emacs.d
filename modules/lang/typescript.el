(use-package tide
  :after (web-mode company-mode) 
  :config
  (defun snow-setup-tide-mode ()
    (interactive)
    (setq tide-tsserver-executable "node_modules/typescript/bin/tsserver")
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1) 
    (company-mode +1))

  
  (add-hook 'typescript-mode #'setup-tide-mode)
  (add-hook 'web-mode
            (lambda ()
              (when (string-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide-mode)))))

