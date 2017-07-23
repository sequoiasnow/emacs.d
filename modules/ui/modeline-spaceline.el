(use-package all-the-icons)

;; Set the colors of hte modeline
(custom-set-faces 
 `(mode-line                ((t (:inherit nil :foreground "white"    :background nil))))
 `(mode-line-inactive       ((t (:inherit nil :foreground "gray"     :background nil :box nil))))
 `(powerline-active1        ((t (:inherit nil :foreground "white"    :background "SkyBlue4"))))
 `(powerline-active2        ((t (:inherit nil :foreground "white"    :background nil))))
 `(powerline-inactive1      ((t (:inherit nil :foreground "SkyBlue4" :background nil))))
 `(powerline-inactive2      ((t (:inherit nil :foreground "orange"   :background nil))))
 `(spaceline-highlight-face ((t (:inherit nil :foreground "SkyBlue1" :background "SkyBlue4")))))

;; Initialize the spaceline theme
(use-package spaceline
  :init
  (setq ns-use-srgb-colorspace nil)
  (setq powerline-default-separator 'utf-8)
  (setq powerline-height 1.4))

(use-package spaceline-all-the-icons
  :after (spaceline nlinum)
  :init 
  (setq spaceline--all-the-icons-seperator-type 'slant
        spaceline-all-the-icons-slim-render nil
        spaceline-all-the-icons--git-ahead 'commit
        spaceline-all-the-icons-icon-set-window-numbering 'square
        spaceline-all-the-icons-seperator-type 'slantg) 
  :config
  (spaceline-all-the-icons-theme)
  (spaceline-all-the-icons--setup-git-ahead)
  (spaceline-all-the-icons--setup-neotree)
  (spaceline-toggle-all-the-icons-flycheck-status-on)
  (spaceline-toggle-all-the-icons-git-ahead-on)
  (spaceline-toggle-all-the-icons-buffer-position-on)
  (spaceline-toggle-all-the-icons-flycheck-status-info-on)
  (spaceline-toggle-all-the-icons-git-status-on)
  (spaceline-toggle-all-the-icons-projectile-on)
  (spaceline-toggle-all-the-icons-sunrise-on)
  (spaceline-toggle-all-the-icons-window-number-on) 
  (spaceline-toggle-all-the-icons-hud-on)
  (spaceline-toggle-all-the-icons-mode-icon-on))
