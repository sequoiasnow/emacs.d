;; Add default package archives
(require 'package)

(defvar snow-core-packages '(use-package)
  "The essential packages needed before startup.")

(defvar snow--orig-load-path load-path
  "The origional emacs load path")

(defvar snow--base-load-path
  (cons snow-core-dir snow--orig-load-path)
  "The load path for all of emacs")

(print snow--base-load-path)

(defvar snow--installed-packages ()
  "The packages installed in this session")

(defun snow-initialize ()
  (setq
   load-path snow--base-load-path
   package-archives
   '(("melpa" . "http://melpa.milkbox.net/packages/"))
   ;; Essentially makes use-package work with package.el
   use-package-always-ensure t)
  (package-initialize)
  (mapc (lambda (package)
          (unless (package-installed-p package)
            (if (= (length snow--installed-packages) 0)
                (print "Refreshhing package contents")
              (package-refresh-contents))
            (setq snow--installed-packages (add-to-list 'snow--installed-packages package))
            (package-install package))) snow-core-packages))


(defun snow-add-languages (&rest langs)
  (mapc (lambda (lang)
          (load (concat snow-modules-dir "lang/" lang))) langs))

(defun use-modeline (line)
  (load (concat snow-modules-dir "ui/modeline/" line)))

(defun add-ui-element (&rest elements)
  (mapc (lambda (elem)
          (load (concat snow-modules-dir "ui/" elem))) elements))

(provide 'core-packages)
