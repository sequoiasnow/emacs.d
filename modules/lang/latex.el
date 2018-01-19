;; Enable latex preview pane
(use-package latex-preview-pane
  :config
  (setq doc-view-continuous t)
  (setq pdf-latex-command "xelatex")
  (latex-preview-pane-enable))
