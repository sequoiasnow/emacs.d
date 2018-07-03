(use-package markdown-mode :mode "\\.md$"
  :config (add-hook 'markdown-mode-hook 'flyspell-mode))
