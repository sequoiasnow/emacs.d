(use-package aggressive-indent
  :after web-mode
  :config
  (global-aggressive-indent-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'haskell-mode))

