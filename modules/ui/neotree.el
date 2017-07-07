(use-package projectile
  :config (projectile-global-mode))

(use-package neotree
  :after projectile
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrown))
  :config
  ;; When a project changes, also change neotree
  (defun neotree-change-proj-dir () 
    "Changes the neotree directory to the currnet project"
    (let ((project-dir (projectile-project-root)) 
          (file-name   (bugger-file-name)))
      (if project-dir
          (when (neo-global--window-exists-p)
            (neotree-dir project-dir)
            (neotree-find file-name))
        (message "Could not finf git project root."))))
  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)      
    (neotree-toggle)
    (neotree-change-proj-dir))
  (global-set-key (kbd "s-/") #'neotree-project-dir)
  (add-hook 'projectile-after-switch-project-root #'neotree-change-proj-dir))
