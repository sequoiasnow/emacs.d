(use-package haskell-mode
  :defer t
  :mode "\\.hs$"
  :mode ("\\.ghci$" . ghci-script-mode)
  :mode ("\\.cabal$" . haskell-cabal-mode)
  :interpreter (("runghc" . haskell-mode)
                ("runhaskell" . haskell-mode))
  :config

  (push ".hi" completion-ignored-extensions)


  ;; Add haskell module declaration to the creation of a new file.
  (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

  ;; Enable saving etags of current haskell files on save
  (setq haskell-tags-on-save t)

  ;; Align file
  (global-set-key (kbd "C-c RET") 'haskell-mode-stylish-buffer)
  (setq haskell-stylish-on-save t)

  ;; Tell haskell to use stack
  (setq  haskell-process-type 'stack-ghci))


(use-package lsp-haskell
  :after haskell-mode lsp-mode
  :config
  ;; haskell-language-editor
  (add-hook 'haskell-mode-hook #'lsp)
  (add-hook 'haskell-literate-mode-hook #'lsp))
