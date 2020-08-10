;; Enable latex preview pane
(use-package latex-preview-pane
  :defer t
  :init
  (setq pdf-latex-command "xelatex")
  (setq doc-view-continuous t)
  :config
  (latex-preview-pane-enable))


;; Auto complete for Latex by AUCTex
(use-package auctex
  :defer t
  :ensure t
  :init
  (setq TeX-parse-self t) ; Enable Parse on load
  (setq TeX-auto-save t)  ; Enable Parse on save
  (setq TeX-PDF-mode t)   ; Use pdf-mode
  :config
  (add-hook 'Tex-mode-hook
            (lambda () (TeX-fold-mode 1))) ; Automatically active text fold mode
  (add-hook 'TeX-mode-hook 'LaTeX-math-mode))
