(use-package aggressive-indent
  :after web-mode
  :config
  (add-hooks 
   '(css-mode-hook
     emacs-lisp-mode-hook
     c-mode
     c++mode
     js-mode
     php-mode
     web-mode-hook
     tide-mode-hook) #'aggressive-indent-mode))

