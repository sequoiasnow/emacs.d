(use-package markdown-mode :mode "\\.md$")

;; MMM allows highlighting syntax blocks in markdown buffer.
(use-package mmm-mode
  :config
  (progn
    (defun snow-mmm-markdown-auto-class (lang &optional submode)
      "Define a mmm-mode class for LANG in `markdown-mode' using SUBMODE.
  If SUBMODE is not provided, use `LANG-mode' by default."
      (let ((class (intern (concat "markdown-" lang)))
            (submode (or submode (intern (concat lang "-mode"))))
            (front (concat "^```" lang "[\n\r]+"))
            (back "^```"))
        (mmm-add-classes (list (list class :submode submode :front front :back back)))
        (mmm-add-mode-ext-class 'markdown-mode nil class)))

    ;; Mode names that derive directly from the language name
    (mapc 'snow-mmm-markdown-auto-class
          '("awk" "bibtex" "c" "cpp" "css" "html" "latex" "lisp" "makefile"
            "markdown" "python" "r" "ruby" "sql" "stata" "xml" "haskell" "javascript"
            "json" "swift" "yaml"))

    ;; Add a simple binding in order to make parsing the buffer easier.
    (global-set-key (kbd "C-c m") 'mmm-parse-buffer)
    ))
