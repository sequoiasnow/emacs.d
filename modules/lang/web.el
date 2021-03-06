(use-package web-mode
  :defer t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'"       . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'"      . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\'"     . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ms\\'"       . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'"      . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'"      . web-mode))
  (add-to-list 'auto-mode-alist '("\\.php\\'"      . web-mode))
  (add-to-list 'auto-mode-alist '("\\.njk\\'"      . web-mode))

  (setq web-mode-content-types-alist  '(("jsx" . "\\.js[x]?$")))
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(use-package tide
  :after web-mode
  :defer t
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
              (when (string-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide)))))

;; Set the default tab width for css to 2
(setq-default css-indent-offset 2)


(use-package scss-mode
  :defer t
  :config
  (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
  (setq-default scss-compile-on-save nil))
