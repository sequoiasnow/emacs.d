(use-package projectile
  :config (projectile-global-mode))
(use-package neotree 
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrown))
  :config
  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))
  (global-set-key (kbd "s-/") 'neotree-project-dir))
