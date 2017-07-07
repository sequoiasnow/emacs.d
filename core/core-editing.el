;; A variety of languages that are used for the projec.t


;; Make life a bit more evil with the great and glorious evil mode
(use-package evil
  :init
  (setq evil-search-module 'evil-search)
  :config
  (evil-mode 1))

(use-package evil-vimish-fold
  :config
  (evil-vimish-fold-mode 1))

;; Keep indentiation consistent with aggressive-indent mode.
(use-package aggressive-indent 
  :config
  (add-hooks 
   '(css-mode-hook
     emacs-lisp-mode-hook
     c-mode
     c++mode
     js-mode
     php-mode
     web-mode-hook) #'aggressive-indent-mode))

(use-package paredit 
  :config
  (progn
    (autoload 'enable-paredit-mode "paredit")
    (add-hooks '(emacs-lisp-mode-hook
                 eval-expression-minibuffer-setup-hook
                 ielm-mode-hook
                 lisp-mode-hook
                 lisp-interaction-mode-hook
                 scheme-mode-hook
                 clojure-mode-hook
                 cider-repl-mode-hook
                 web-mode
                 php-mode
                 c-mode
                 c++mode) #'enable-paredit-mode)))

(use-package rainbow-delimiters
             :config
             (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package company
             :config
             (add-hook 'after-init-hook 'global-company-mode))

(use-package yasnippet
  :config
  (yas-global-mode 1))


;; (use-package helm-core
;;   :config
;;   (helm-mode 1))

;; Enablwe eldoc in order to have a better overall editing experience for elisp
(add-hooks '(emacs-lisp-mode-hook
             lisp-interaction-mode-hook
             ielm-mode-hook) 'turn-on-eldoc-mode)

(provide 'core-editing)
