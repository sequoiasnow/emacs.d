(use-package evil
  :init
  (setq evil-search-module 'evil-search)
  (setq evil-search-wrap t)
  (setq evil-flash-delay 5)
  :config
  (evil-mode 1))

(use-package evil-vimish-fold
  :defer 4
  :config
  (evil-vimish-fold-mode 1))
