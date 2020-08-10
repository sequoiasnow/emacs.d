(use-package all-the-icons-dired
  :defer 2
  :after all-the-icons
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))
