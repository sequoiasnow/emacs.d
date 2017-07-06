(use-package web-mode
  :config
  (progn
    (defun snow-add-web-auto (extension)
      (add-to-list 'auto-mode-alist  (cons
                                      (concat "\\" extension "$") web-mode)))
    (mapcar 'snow-add-web-auto '(".js"
                                 ".jsx"
                                 ".html"
                                 ".ms"
                                 ".erb"
                                 ".mustache"
                                 ".scss"
                                 ".tsx")))
  (setq web-mode-content-type-alist
        '(("jsx" . "\\.js[x]?$"))))
