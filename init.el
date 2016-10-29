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

;; change all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; Allow the loading of additional files from the lisp directory.
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Ensure languages are loaded from ./list/languages.el
(load "languages.el")

;; Ensure editing packages are installed
(load "editing.el")

;; Ensure themes are loaded.
(load "themes.el")

;; Enable information about org mode.
(load "org-mode")


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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(linum-format " %7i ")
 '(package-selected-packages
   (quote
    ((quote yasnippet)
     yasnippet helm-projectile magit fancy-battery spaceline powerline yaml-mode web-mode vi-tilde-fringe swift-mode sublime-themes scss-mode rust-mode rich-minority rainbow-mode rainbow-delimiters paredit neotree matlab-mode markdown-preview-mode markdown-preview-eww markdown-mode+ js2-mode impatient-mode helm haskell-mode evil dockerfile-mode color-theme-sanityinc-tomorrow clojure-mode-extra-font-locking cider auto-complete aggressive-indent)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :slant normal :weight normal :height 130 :width normal :family "Fira Mono for Powerline")))))
