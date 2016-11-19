(require 'package)

;; Allow more types of packages to be installed through various repositiories.
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(defun ensure-package-installed (&rest packages)
  "Ensure every needed package is installed through available repositiories"
  (mapcar (lambda (package) 
    (if (package-installed-p package)
      nil
      (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
  packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(setq package-enable-at-startup nil)
(package-initialize)

;; Ensure the exec-path includes all elements of the local path.
(setq exec-path (append exec-path (list "/usr/local/bin"
                                        "/usr/local/sbin"
                                        (expand-file-name "~/bin"))))
(setenv "PATH" (concat
                "/usr/local/bin:/usr/local/sbin/usr/bin"
                (getenv "PATH")))


;; change all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; Allow the loading of additional files from the lisp directory.
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Ensure languages are loaded from ./list/languages.el
(require 'languages) 

;; Ensure editing packages are installed
(require 'editing) 

;; Ensure themes are loaded.
(require 'themes) 

;; Enable information about org mode.
(require 'org-mode)

;; Lets play with powerline...
(ensure-package-installed 'spaceline)
(require 'spaceline-config)
(spaceline-spacemacs-theme)
(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)

;; Fix minor bug in the gui
(setq powerline-height 20)
(setq powerline-raw " ")
(setq ns-use-srgb-colorspace nil)

;; Default don't show the emacs splashcreen
(setq inhibit-startup-screen t)

;; Set the default font.
(when (eq system-type 'darwin)
  (set-face-attribute 'default nil :family "Source Code Pro for Powerline"))

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (jade-mode stylus-mode helm-swoop yasnippet yaml-mode web-mode vi-tilde-fringe swift-mode sublime-themes spaceline smooth-scrolling scss-mode rust-mode rich-minority rainbow-mode rainbow-delimiters php-extras paredit neotree matlab-mode markdown-preview-mode markdown-preview-eww markdown-mode+ magit lorem-ipsum js2-mode impatient-mode helm-projectile helm-dash haskell-mode fancy-battery evil dockerfile-mode color-theme-sanityinc-tomorrow clojure-mode-extra-font-locking cider auto-complete aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
