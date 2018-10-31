;; Enable latex preview pane
(use-package latex-preview-pane
  :init
  (setq pdf-latex-command "xelatex")
  (setq doc-view-continuous t)
  :config
  (latex-preview-pane-enable))

;; Better doc view rendering
(setq doc-view-resolution 300)

;; Nice PdfView for Retina screens
(use-package pdf-tools
  :config
  (setq pdf-view-midnight-colors `(,(face-attribute 'default :foreground) .
                                   ,(face-attribute 'default :background)))
  
  (add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))
  
  (add-hook 'pdf-view-mode-hook (lambda ()
                                  (pdf-view-midnight-minor-mode))))

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
