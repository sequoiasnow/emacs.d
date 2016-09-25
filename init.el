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

;; Allow the loading of additional files from the lisp directory.
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Ensure languages are loaded from ./list/languages.el
(load "languages.el")

;; Ensure editing packages are installed
(load "editing.el")

;; Ensure themes are loaded.
(load "themes.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
