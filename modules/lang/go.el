(use-package go-mode :defer t)
(use-package eldoc :defer t)
(use-package company-go
  :defer t
  :after go-mode
  :config
  (add-hook 'go-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends) '(company-go))
              (local-set-key (kbd "M-.") 'godef-jump)
              (go-eldoc-setup)
                                        ; call Gofmt before saving
              (add-hook 'before-save-hook 'gofmt-before-save))))


;; Add go path to exec-path
(add-to-list 'exec-path "/Users/sequoiasnow/go/bin" t)
