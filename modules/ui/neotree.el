(use-package projectile
  :config (projectile-global-mode))

(use-package neotree
  :after (projectile doom-themes evil)
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrown))
  :config
  ;; When a project changes, also change neotree
  (defun neotree-change-proj-dir () 
    "Changes the neotree directory to the currnet project"
    (let ((project-dir (projectile-project-root)) 
          (file-name   (buffer-file-name)))
      (if project-dir
          (when (neo-global--window-exists-p)
            (neotree-dir project-dir)
            (neotree-find file-name))
        (message "Could not find git project root."))))

  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)      
    (neotree-toggle)
    (neotree-change-proj-dir))

  (global-set-key (kbd "s-/") #'neotree-project-dir)
  (add-hook 'projectile-after-switch-project-root #'neotree-change-proj-dir)

  ;; Use doom to make neotree prettier
  (doom-themes-neotree-config)
  ;; Also include evil keybindings
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter))


