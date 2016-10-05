(ensure-package-installed 'cider
			  'auto-complete
			  'aggressive-indent
			  'rainbow-mode
			  'rainbow-delimiters
			  'evil
			  'helm
			  'paredit
                          'neotree
                          'scss-mode)

;; Default autocomplete configuration.
(require 'auto-complete)
(ac-config-default)

;; Creates the aggressive indent.
(require 'aggressive-indent)
(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;; Adds the rainbow delimiters mode.
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Enable evil mode editing for vim keybindings.
(require 'evil)
(evil-mode 1)

;; Enable the helm configuration
(require 'helm-config)

;; Enable the configuration of neotree
(setq neo-theme 'arrow)
(global-set-key (kbd "M-]") 'neotree-toggle)

;; Add paraedit support to any lisp file.
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; Language mode for extensions of clojure.
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))


;; Show matching parenthasies
(show-paren-mode 1)

;; Highlight the current line
                                        ; (require 'hl-line)
                                        ; (global-hl-line-mode 1)

;; Use soft tabs.
(setq-default indent-tabs-mode nil)

;; Put all backup files in one reasonable location.
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))

;; Show line numbers for convenience.
(global-linum-mode)

;; Don't ring the bell
(setq ring-bell-function 'ignore)

;; Disable the anoying gui toolbar.
(tool-bar-mode -1)

;; Also disable the scrollbars.
(scroll-bar-mode -1)

;; Set the tab width for different styles, such as html or sass
(setq scss-indent-offset 2)
(setq css-indent-offset 2)
