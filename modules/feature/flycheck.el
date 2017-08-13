(use-package fringe-helper)
(use-package flycheck
  :after (fringe-helper)
  :init
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (fringe-helper-define 'flycheck-indication-mode 'center
    "XX......"
    "..XX...." 
    "....XX.."
    "......XX")
  :config
  (global-flycheck-mode))

