
(use-package lsp-mode
  :config
  (evil-define-key 'normal lsp-mode-map (kbd "gm") 'lsp-ui-imenu)
  (evil-define-key 'normal lsp-mode-map (kbd "gd") 'lsp-ui-peek-find-definitions)
  (evil-define-key 'normal lsp-mode-map (kbd "gr") 'lsp-ui-peek-find-references)
  (evil-define-key 'normal lsp-mode-map (kbd "en") 'flycheck-next-error)
  (evil-define-key 'normal lsp-mode-map (kbd "ep") 'flycheck-previous-error)
  (evil-define-key 'normal lsp-mode-map (kbd "el") 'flycheck-list-errors)
  (evil-define-key 'normal lsp-mode-map (kbd "ee") 'flycheck-explain-error-at-point)
  (evil-define-key 'normal lsp-mode-map (kbd "rR") 'lsp-rename)
  (evil-define-key 'normal lsp-mode-map (kbd "rf") 'lsp-format-buffer)
  (evil-define-key 'normal lsp-mode-map (kbd "ra") 'lsp-ui-sideline-apply-code-actions)
  (evil-define-key 'normal lsp-mode-map (kbd ",") 'completion-at-point)
  (evil-define-key 'normal lsp-mode-map (kbd  ".") 'lsp-describe-thing-at-point)
  :defer 2)

(use-package lsp-ui
  :defer 2)

(use-package lsp-ivy
  :defer 2)

(use-package lsp-haskell
  :after haskell-mode lsp-mode
  :config
  ;; haskell-language-editor
  (add-hook 'haskell-mode-hook #'lsp)
  (add-hook 'haskell-literate-mode-hook #'lsp))
