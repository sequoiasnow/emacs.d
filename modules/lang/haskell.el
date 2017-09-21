(use-package haskell-mode
  :mode "\\.hs$"
  :mode ("\\.ghci$" . ghci-script-mode)
  :mode ("\\.cabal$" . haskell-cabal-mode)
  :interpreter (("runghc" . haskell-mode)
                ("runhaskell" . haskell-mode))
  :config
  (push ".hi" completion-ignored-extensions) 
  
  ;; Enables company mode to mix definitions from haskell-mode
  ;; imports with local completions from functions and blocked
  ;; scoped variables.
  ;; @see http://haskell.github.io/haskell-mode/manual/latest/Completion-support.html#Completion-support
  (add-hook 'haskell-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends)
                   (append '((company-capf company-dabbrev-code))
                           company-backends))))
  
  ;; Add haskell module declaration to the creation of a new file.
  (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

  ;; Enable saving etags of current haskell files on save
  (setq haskell-tags-on-save t)
  (define-key haskell-mode-map (kbd "M-.") 'haskell-mode-tag-find)

  ;; Tell haskell to use stack
  (setq  haskell-process-type 'stack-ghci))
