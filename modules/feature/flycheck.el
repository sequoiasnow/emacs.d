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

(use-package flyspell
  :init
  (add-hook 'prog-mode-hook
            (lambda ()
              (flyspell-prog-mode)))
  (add-hook 'text-mode-hook
            (lambda ()
              (flyspell-mode 1))))
