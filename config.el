
(setenv "PATH" (concat "/Library/TeX/texbin:/usr/local/bin:/usr/local/sbin:~/.cabal/bin:~/bin:/opt/local/bin:/opt/local/sbin:"
                       (getenv "PATH")))
(setq exec-path (append `("/usr/local/bin"
                          "/usr/local/sbin"
                          "/Library/Tex/texbin"
                          "/opt/local/bin"
                          "/opt/local/sbin"
                          ,(expand-file-name "~/bin")
                          ,(expand-file-name "~/.cabal/bin"))
                        exec-path))

(setq load-path (cons (expand-file-name "~/.emacs.d/lisp") load-path))
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/lisp"))

(require 'package)
(add-to-list 'package-archives 
             '("marmalade" .
               "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(global-linum-mode t)
(unless window-system
  (add-hook 'linum-before-numbering-hook
            (lambda ()
              (setq-local linum-format-fmt
                          (let ((w (length (number-to-string
                                            (count-lines (point-min) (point-max))))))
                            (concat "%" (number-to-string w) "d "))))))

(defun linum-format-func (line)
  (concat
   (propertize (format linum-format-fmt line) 'face 'linum)
   (propertize " " 'face 'mode-line)))

(unless window-system
  (setq linum-format 'linum-format-func))

(show-paren-mode 1)

(setq-default indent-tabs-mode nil)

(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))

(add-to-list 'default-frame-alist '(font . "Fira Mono for Powerline"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Full width comment box                                                 ;;
;; from http://irreal.org/blog/?p=374                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun bjm-comment-box (b e)
  "Draw a box comment around the region but arrange for the region to extend to at least the fill column. Place the point after the comment box."

  (interactive "r")

  (let ((e (copy-marker e t)))
    (goto-char b)
    (end-of-line)
    (insert-char ?  (- fill-column (current-column)))
    (comment-box b e 1)
    (goto-char e)
    (set-marker e nil)))

(global-set-key (kbd "C-c b b") 'bjm-comment-box)

(setq package-contents-have-been-updated nil)
(defun ensure-package-installed (&rest packages)
  "Ensures all passed packages are installed through configured repositories."
  (mapcar (lambda (package)
            (unless (package-installed-p package)
              (unless package-contents-have-been-updated
                (package-refresh-contents)
                (setq package-contents-have-been-updated t)) 
              (package-install package))) 
          packages))

(defvar default-packages '(swift-mode
                           haskell-mode
                           rust-mode
                           web-mode
                           clojure-mode
                           markdown-mode
                           dockerfile-mode
                           yaml-mode
                           scss-mode))

(apply 'ensure-package-installed default-packages)

(ensure-package-installed 'evil)
(evil-mode 1)
(setq evil-search-module 'evil-search)

(ensure-package-installed 'spaceline)
(require 'spaceline-config)
(spaceline-spacemacs-theme)
(setq powerline-default-seperator 'wave)
(spaceline-toggle-minor-modes-off)
(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)

(setq powerline-height 20)
(setq powerline-raw " ")
(setq ns-use-srgb-colorspace nil)

(ensure-package-installed 'aggressive-indent)
(require 'aggressive-indent)
(add-hook 'css-mode-hook #'aggressive-indent-mode)
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'c-mode #'aggressive-indent-mode)
(add-hook 'c++-mode #'aggressive-indent-mode)
(add-hook 'js-mode #'aggressive-indent-mode)
(add-hook 'php-mode #'aggressive-indent-mode)
(add-hook 'web-mode-hook #'aggressive-indent-mode)

(add-to-list 'aggressive-indent-excluded-modes 'html-mode)
(add-to-list 'aggressive-indent-excluded-modes 'stylus-mode)

(ensure-package-installed 'paredit)
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook                  #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook                        #'enable-paredit-mode)
(add-hook 'lisp-mode-hook                        #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook            #'enable-paredit-mode)
(add-hook 'scheme-mode-hook                      #'enable-paredit-mode)
(add-hook 'clojure-mode-hook                     #'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook                  #'enable-paredit-mode)

(ensure-package-installed 'rainbow-delimiters)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(ensure-package-installed 'company)
(add-hook 'after-init-hook 'global-company-mode)

(ensure-package-installed 'yasnippet)
(yas-global-mode 1)

(ensure-package-installed 'smooth-scrolling)
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

(ensure-package-installed 'helm)
(require 'helm-config)
(helm-mode 1)

(ensure-package-installed 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(add-hook 'emacs-lisp-mode-hook       'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook             'turn-on-eldoc-mode)

(ensure-package-installed 'sublime-themes
                          'color-theme-sanityinc-tomorrow)
(setq custom-safe-themes t)
(require 'snow-custom-simple-theme)
(require 'snow-mac-light-theme)

(load-theme 'snow-mac-light t)

(ensure-package-installed 'cider 'clojure-mode)
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

(ensure-package-installed 'web-mode)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'"      . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.ms\\'"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'"      . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))

(defun my-setup-indent (n)
  ;; java/c/c++
  (setq c-basic-offset n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file 
  (setq css-indent-offset n) ; css-mode
  )

(my-setup-indent 2)

(ensure-package-installed 'php-extras)

(ensure-package-installed 'stylus-mode)

(ensure-package-installed 'graphql-mode)

(ensure-package-installed 'elm-mode
                          'flycheck
                          'flycheck-elm)
(require 'elm-mode)
(require 'flycheck)
(with-eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-elm-setup))

(ensure-package-installed 'haskell-mode 'company-ghc)
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))
(custom-set-variables '(haskell-tags-on-save t))

(custom-set-variables
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t))
(eval-after-load 'haskell-mode '(progn
                                  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
                                  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
                                  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
                                  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
                                  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
                                  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)))
(eval-after-load 'haskell-cabal '(progn
                                   (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
                                   (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
                                   (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
                                   (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(custom-set-variables '(haskell-process-type 'stack-ghci))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(ensure-package-installed 'mmm-mode)
(require 'mmm-mode)
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
        "json" "swift"))

;; Add a simple binding in order to make parsing the buffer easier.
(global-set-key (kbd "C-c m") 'mmm-parse-buffer)

(add-hook 'sql-mode-hook
          (lambda ()
            (setq tab-width 4)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((clojure .t)
   (sh . t)
   (dot . t)
   (emacs-lisp . t)
   (ruby . t)
   (haskell . t)))

(setq org-src-fontify-natively t)

(setq org-latex-create-formula-image-program 'dvipng)
