(defun add-hooks (modes hook)
  (mapcar (lambda (mode)
            (add-hook mode hook)) modes))


(provide 'core-lib)
