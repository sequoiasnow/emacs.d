(use-package all-the-icons)

;; Initialize the spaceline theme
(use-package spaceline)

(use-package spaceline-all-the-icons 
  :after spaceline
  :init
  (setq ns-use-srgb-colorspace nil)
  (setq powerline-default-separator 'utf-8)
  (setq powerline-height 40)
  :config
  (spaceline-all-the-icons-theme)
  (spaceline-all-the-icons--setup-git-ahead)
  )


