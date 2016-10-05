(require 'package)

;; Allow more types of packages to be installed through various repositiories.
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" default)))
 '(linum-format " %7i ")
 '(package-selected-packages
   (quote
    (color-theme-sanityinc-tomorrow vi-tilde-fringe yaml-mode scss-mode matlab-mode markdown-preview-mode markdown-preview-eww impatient-mode markdown-mode+ neotree markdown-mode web-mode swift-mode sublime-themes rust-mode rainbow-mode rainbow-delimiters paredit helm haskell-mode evil clojure-mode-extra-font-locking cider auto-complete aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
