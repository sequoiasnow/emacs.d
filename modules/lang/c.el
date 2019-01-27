;; (add-hook 'c-mode-hook
;;           (lambda ()
;;             (setq tab-width 4)))
(add-hook 'c-mode-hook
          (lambda () (setq flycheck-clang-include-path
                           (list (expand-file-name "/opt/X11/include/")))))

(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-include-path
                           (list (expand-file-name "/opt/X11/include/")))))
