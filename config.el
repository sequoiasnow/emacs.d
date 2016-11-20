
(setenv "PATH" (concat "/usr/local/bin:/usr/local/sbin:~/bin"
                       (getenv "PATH")))
(setq exec-path (append '("/usr/local/bin"
                          "/usr/local/sbin"
                          (expand-file-name "~/bin"))
                        exec-path))

(require 'package)
(add-to-list 'package-archives 
             '("marmalade" .
               "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Line numbers
(global-linum-mode)
(setq linum-format " %d ")

;; Soft Tabs
(setq indent-tabs-mode nil)

;; Show matching parenthasies
(show-paren-mode 1)

(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))

(setq package-contents-have-been-updated nil)
(defun ensure-package-installed (&rest packages)
  "Ensures all passed packages are installed through configured repositories."
  (mapcar (lambda (package)
            (unless (package-installed-p package)
              (unless package-contents-have-been-updated
                (package-refresh-contents)
                (setq package-contents-have-been-updated t)) 
              (package-install package))) 
          packages))

(defvar default-packages '(swift-mode
                           haskell-mode
                           rust-mode
                           web-mode
                           clojure-mode
                           markdown-mode
                           dockerfile-mode
                           yaml-mode
                           scss-mode))

(apply 'ensure-package-installed default-packages)

(ensure-package-installed 'evil)
(evil-mode 1)
(setq evil-search-module 'evil-search)

(ensure-package-installed 'spaceline)
(require 'spaceline-config)
(spaceline-spacemacs-theme)
(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)

(setq powerline-height 20)
(setq powerline-raw " ")
(setq ns-use-srgb-colorspace nil)

(ensure-package-installed 'aggressive-indent)
(require 'aggressive-indent)
(global-aggressive-indent-mode 1)

(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

(ensure-package-installed 'paredit)
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook                  #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook                        #'enable-paredit-mode)
(add-hook 'lisp-mode-hook                        #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook            #'enable-paredit-mode)
(add-hook 'scheme-mode-hook                      #'enable-paredit-mode)
(add-hook 'clojure-mode-hook                     #'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook                  #'enable-paredit-mode)

(ensure-package-installed 'rainbow-delimiters)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(ensure-package-installed 'company)
(add-hook 'after-init-hook 'global-company-mode)

(ensure-package-installed 'yasnippet)
(yas-global-mode 1)

(ensure-package-installed 'smooth-scrolling)
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

(ensure-package-installed 'helm)
(require 'helm-config)
(helm-mode 1)

(ensure-package-installed 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(add-hook 'emacs-lisp-mode-hook       'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook             'turn-on-eldoc-mode)

(ensure-package-installed 'sublime-themes
                          'color-theme-sanityinc-tomorrow)
(setq custom-safe-themes t)
(load-theme 'sanityinc-tomorrow-bright t)

(ensure-package-installed 'cider 'clojure-mode)
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

(ensure-package-installed 'web-mode)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'"      . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.ms\\'"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'"      . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))

(ensure-package-installed 'php-extras)
