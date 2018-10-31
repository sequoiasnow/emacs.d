(use-package markdown-mode :mode "\\.md$"
  :config (add-hook 'markdown-mode-hook 'flyspell-mode))

(set-face-attribute 'markdown-pre-face nil
                    :inherit nil
                    :background nil)
(set-face-attribute 'markdown-code-face nil
                    :inherit nil
                    :background nil)

