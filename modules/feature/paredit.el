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
