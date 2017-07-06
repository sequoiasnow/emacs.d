(use-package all-the-icons)

;; Initialize the spaceline theme
(use-package spaceline)

(use-package spaceline-all-the-icons 
  :after spaceline
  :init
  (setq ns-use-srgb-colorspace nil)
  :config (spaceline-all-the-icons-theme))


