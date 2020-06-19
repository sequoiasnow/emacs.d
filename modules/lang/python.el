;; Set the python indent globally 
(setq-default python-indent 2)

(add-hook 'python-mode-hook (lambda ()
                              (setq-default python-indent 2)))

