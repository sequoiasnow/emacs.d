;; -*-no-byte-compile: t; -*-

(use-package dash-at-point
  :defer 1
  :bind (("C-c d" . dash-at-point)
         ("C-c e" . dash-at-point-with-docset)))

(use-package counsel-dash
  :defer 1
  :config
  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (setq-local counsel-dash-docsets '("Emacs Lisp"))))
  (add-hook 'ruby-mode-hook
            (lambda ()
              (setq-local counsel-dash-docsets '("Ruby"))))
  (add-hook 'haskell-mode-hook
            (lambda ()
              (setq-local counsel-dash-docsets '("Haskell")))))
