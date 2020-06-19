(use-package vue-mode
  :config
  (setq-default js-indent-level 2)
  (add-hook 'mmm-mode-hook
            (lambda ()
              (set-face-background 'mmm-default-submode-face nil))))
