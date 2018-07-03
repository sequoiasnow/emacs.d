(use-package doom-themes
  :init 
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  :config
  (load-theme 'doom-dracula t))

(use-package solaire-mode
  :disabled ;; Until margin highlighting is ok again
  :config
  ;; brighten buffers (that represent real files)
  (add-hook 'after-change-major-mode-hook #'turn-on-solaire-mode)
  ;; To enable solaire-mode unconditionally for certain modes:
  (add-hook 'ediff-prepare-buffer-hook #'solaire-mode)


  (defun snow|recolor-solaire-fringes ()
    (unless (solaire-mode--real-buffer-fn (current-buffer))
      (set-window-fringes (get-buffer-window (current-buffer)) 0 0 nil)))

  ;; if the bright and dark background colors are the wrong way around, use this
  ;; to switch the backgrounds of the `default` and `solaire-default-face` faces.
  ;; This should be used *after* you load the active theme!
  ;;
  ;; NOTE: This is necessary for themes in the doom-themes
  (solaire-mode-swap-bg))
