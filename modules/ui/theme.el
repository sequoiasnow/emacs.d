(use-package doom-themes
  :init 
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  :config
  (load-theme 'doom-one t) 
  (set-face-foreground 'vertical-border "#39393D"))

