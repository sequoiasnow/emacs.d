(when (display-graphic-p)
  (use-package all-the-icons-ivy
    :after all-the-icons
    :config (all-the-icons-ivy-setup)))

(use-package counsel
  :commands (ivy-mode)
  :bind 
  (("C-x b"   . ivy-switch-buffer)
   ("C-c C-r" . ivy-resume)
   ("M-x"     . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("C-h f"   . counsel-describe-function)
   ("C-h v"   . counsel-describe-variable)
   ("C-h S"   . counsel-info-lookup-symbol)
   ("C-c g"   . counsel-git-grep)
   ("C-c C-g" . counsel-git)
   ("C-c k"   . counsel-ag)
   ("C-x l"   . counsel-locate)) 
  :config
  (ivy-mode 1)
  
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; Use with magit
  (setq magit-completing-read-function 'ivy-completing-read)
  ;; Enable projectile
  (setq projectile-completion-system 'ivy)
  ;; number of result lines to display
  (setq ivy-height 10)
  ;; configure regexp engine.
  (setq ivy-re-builders-alist
        ;; allow input not in order
        '((t   . ivy--regex-ignore-order))))
(use-package counsel-gtags
  :after counsel
  :config
  (add-hook 'c-mode-hook 'counsel-gtags-mode)
  (define-key counsel-gtags-mode-map (kbd "M-t") 'counsel-gtags-find-definition)
  (define-key counsel-gtags-mode-map (kbd "M-r") 'counsel-gtags-find-reference)
  (define-key counsel-gtags-mode-map (kbd "M-s") 'counsel-gtags-find-symbol)
  (define-key counsel-gtags-mode-map (kbd "M-,") 'counsel-gtags-go-backward))


