(defun snow|load-slime-helper ()
  (interactive)
  (let ((slime-helper-f (expand-file-name "~/quicklisp/slime-helper.el")))
    (if (file-exists-p slime-helper-f)
        (load slime-helper-f))))

;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")
