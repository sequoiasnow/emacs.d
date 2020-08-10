(use-package aggressive-indent
  :defer 2
  :config
  (global-aggressive-indent-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'haskell-mode))
