(use-package company
  :bind
  (("C-c C-p" . company-complete)
   ("C-c C-w" . company-show-doc-buffer))
  :config
  (add-hook 'after-init-hook #'global-company-mode)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))
