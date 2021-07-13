(use-package projectile
  :config
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package neotree
  :after (projectile doom-themes evil)
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrown))
  :config
  ;; When a project changes, also change neotree
  (defun neotree-change-proj-dir ()
    "Changes the neotree directory to the currnet project"
    (interactive)
    (when (vc-root-dir)
      (neotree-dir (vc-root-dir))
      (neotree-find (buffer-file-name))))
  (global-set-key (kbd "M-n") 'neotree-change-proj-dir)

  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (progn (neotree-change-proj-dir)
           (neotree-toggle)))

  (global-set-key (kbd "s-/") 'neotree-toggle)
  (global-set-key (kbd "M-/") 'neotree-toggle)
  (add-hook 'projectile-after-switch-project-root #'neotree-change-proj-dir)

  ;; Use doom to make neotree prettier
  (setq doom-neotree-file-icons t)
  (doom-themes-neotree-config)

  ;; Also include evil keybindings
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter))
