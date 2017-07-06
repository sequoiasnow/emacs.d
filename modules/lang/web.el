(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'"       . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'"      . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\'"     . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ms\\'"       . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'"      . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.scss\\'"     . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'"      . web-mode))
  (setq web-mode-content-type-alist
        '(("jsx" . "\\.js[x]?$"))))

(use-package tide
  :after web-mode
  :config
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    ;; company is an optional dependency. You have to
    ;; install it separately via package-install
    ;; `M-x package-install [ret] company`
    (company-mode +1))
  (setq company-tooltip-align-annotations t)
  (add-hook 'typescript-mode-hook #'setup-tide-mode)
  (add-hook 'web-mode-hook
            (lambda ()
              (when (strin-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide)))))

