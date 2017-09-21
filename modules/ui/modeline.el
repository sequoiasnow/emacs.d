(use-package all-the-icons)

;; Keep the snow-modeline-current-window up to date
(defvar snow-modeline-current-window (frame-selected-window))
(defun snow-modeline|set-current-window (&rest _)
  (when (not (minibuffer-window-active-p (frame-selected-window)))
    (setq snow-modeline-current-window (frame-selected-window))))

(add-hook 'window-configuration-change-hook #'snow-modeline|set-current-window)
(add-hook 'focus-in-hook #'snow-modeline|set-current-window)

(defadvice handle-switch-frame
    (after snow-modeline-current-window-after-switch-frame activate)
  (snow-modeline|set-current-window))

(defadvice select-window (after snow-modeline-current-window activate)
  "makes the modelined aware of window changes"
  (snow-modeline|set-current-window))

;;
;; Modeline Helpers
;;

(defun active ()
  (eq (selected-window) snow-modeline-current-window))

(defun snow-modeline|get-icon (icon &optional text face voffset)
  "Displays an octicon ICON with FACE, followed by TEXT. Uses
`all-the-icons-octicon' to fetch the icon."
  (concat
   " "
   (when icon
     (concat
      (all-the-icons-octicon icon :face face :height 1 :v-adjust (or voffset -0.05))
      (if text (propertize " " 'face 'variable-pitch))))
   (when text
     (propertize text 'face face))
   (if vc-mode "  " " ")))

(defun snow-modeline|buffer-file ()
  "The name of the file without all other directory nonsense"
  (if buffer-file-name
      (file-name-nondirectory
       (or buffer-file-truename (file-truename buffer-file-name)))
    "%b"))

(defun snow-modeline|buffer-path ()
  "The path to the file from the current project or directory depending on projectile"
  (if buffer-file-name
      (let ((buffer-path
             (file-relative-name
              (file-name-directory
               (or buffer-file-truename (file-truname buffer-file-name)))
              (if (projectile-project-p)
                  (expand-file-name (concat (projectile-project-root) "../"))
                (expand-file-name "~")))))
        buffer-path)
    ""))


(defun snow-modeline|make-bar (width height color) 
  (create-image
   (format
    (concat
     "/* XPM */ 
static char * segment_bar[] = {
\"%d %d 2 1\",
\". c %s\",
\" c %s\","
     (cl-reduce 'concat
                (make-list height  (concat "\""(make-string width ?.) "\",\n")))
     "};")
    width height
    (if color color "None")
    "red")
   'xpm t :ascent 'center))


;;
;; Modeline Faces
;;

(defvar snow-modeline-height 30
  "How tall should the modeline be")

(defvar snow-modeline-bar-width 3
  "The width of the leftmost bar.")

(defgroup snow-modeline nil
  "All faces assoicated with the custom modeline"
  :group 'emacs)

(defface snow-modeline-buffer-path
  '((t (:inherit mode-line-emphasis :bold t)))
  "Face for the directory part of the buffer path"
  :group 'snow-modeline)

(defface snow-modeline-buffer-file
  '((t (:inherit mode-line-buffer-id)))
  "Face used for the filename part of the modeline buffer"
  :group 'snow-modeline)

(defface snow-modeline-buffer-modified
  '((t (:inherit error :background nil :bold t)))
  "Face used to indicate an unsaved file on the modeline"
  :group 'snow-modeline)

(defface snow-modeline-buffer-major-mode
  '((t (:inherit mode-line-emphasis :bold t)))
  "Show's the current major mode of the modeline, such as emacs-lisp"
  :group 'snow-modeline)

(defface snow-modeline-info
  '((t (:inherit success :bold t)))
  "Face for info-level messages in the modeline. Used by `*vc'."
  :group 'snow-modeline)

(defface snow-modeline-highlight
  '((t (:inherit mode-line-emphasis)))
  "Face for the colorfull parts of the modeline"
  :group 'snow-modeline)

(defface snow-modeline-warning
  '((t (:inherit warning :bold t)))
  "Face for warnings such as those from flycheck"
  :group 'snow-modeline)

(defface snow-modeline-urgent
  '((t (:inherit error :bold t)))
  "Face for errors such as those from flycheck"
  :group 'snow-modeline)

(defface snow-modeline-bar
  '((t (:inherit highlight)))
  "The face for the left-most bar of the active window"
  :group 'snow-modeline)

(defface snow-modeline-inactive-bar
  '((t (:inherit warning :inverse-video t)))
  "The face for the bar when the window is innactive"
  :group 'snow-modeline)

(defface snow-modeline-rocket
  `((t (:foreground ,(face-foreground 'cursor nil t))))
  "The face of the rocket icon in the modeline"
  :group 'snow-modeline)

(defface snow-modeline-inactive-rocket
   `((t (:foreground ,(face-foreground 'fringe nil t))))
  "The face of the rocket icon on the inactive modeline"
  :group 'snow-modeline)

;;
;; Modeline Functions
;;

(defmacro def-modeline-segment! (name &rest body)
  "Defines a modeline segment and assigns is a name"
  (declare (indent defun) (doc-string 2))
  (let ((sym (intern (format "snow-modeline-segment--%s" name)))) 
    `(defun ,sym () ,@body)))

(defun snow--prepare-modeline-segments (segments)
  (cl-loop for seg in segments
           if (stringp seg)
           collect seg
           else
           collect (list
                    (intern (format "snow-modeline-segment--%s"
                                    (symbol-name seg))))))

(defmacro def-modeline! (name lhs &optional rhs)
  "Creates a modeline format string and saves it to a variable"
  (let ((sym (intern (format "snow-modeline-format--%s" name)))
        (lhs-forms (snow--prepare-modeline-segments lhs))
        (rhs-forms (snow--prepare-modeline-segments rhs)))
    `(defun ,sym ()
       (let ((lhs (list ,@lhs-forms))
             (rhs (list ,@rhs-forms)))
         (let ((rhs-string (format-mode-line rhs)))
           (list lhs
                 (propertize
                  " " 'display
                  `((space :align-to (- (+ right right-fringe right-margin)
                                        ,(+ 1 (string-width rhs-string))))))
                 rhs-string))))))

(defun snow-modeline (name)
  "Retreives a modeline of the given name if it exists or returns nil"
  (let ((fn (intern (format "snow-modeline-format--%s" name))))
    (when (functionp fn)
      `(:eval (,fn)))))


(defun snow-set-modeline (name &optional default)
  "Set the current modeline to the key given by def-modeline! if default is set all modelines"
  (when-let (modeline (snow-modeline name))
    (setf (if default
              (default-value 'mode-line-format)
            (buffer-local-value 'mode-line-format (current-buffer)))
          modeline)))

;;
;; Modeline Segments
;;

(def-modeline-segment! buffer-position
  (when (active)
    (if (< (window-width) 80)
        "  %l:%c "
      "  %l:%c %p  ")))

(def-modeline-segment! major-mode
  "Shows the current major mode in the buffer"
  (propertize
   (format-mode-line mode-name)
   'face (if (active) 'snow-modeline-buffer-major-mode)))

(def-modeline-segment! path
  (concat
   (propertize (snow-modeline|buffer-path)
               'face (if (active) 'snow-modeline-buffer-path))
   (propertize (snow-modeline|buffer-file)
               'face (if (active) 'snow-modeline-buffer-file))))

(def-modeline-segment! bar
  (propertize " " 'display
              (snow-modeline|make-bar
               snow-modeline-bar-width
               snow-modeline-height
               (face-background
                (if (active) 'snow-modeline-bar 'snow-modeline-inactive-bar)
                nil t))))

(def-modeline-segment! rocket
  "It's a nice rocket, what more do you want?"
  (snow-modeline|get-icon (if (active) "rocket" "globe")
                          nil
                          (if (active)
                              'snow-modeline-rocket
                            'snow-modeline-inactive-rocket)))

(def-modeline-segment! git
  "Shows the current git branch"
  (when (and vc-mode buffer-file-name (active))
    (let ((branch (substring vc-mode 5)))
      (snow-modeline|get-icon "git-branch"
                              branch
                              (if (active) 'snow-modeline-info 'mode-line-inactive)
                              -0.1))))

(def-modeline-segment! buffer-encoding
  "Displays the encoding and eol style of the buffer the same way Atom does."
  (if (and (active) (> (window-width) 100))
      (concat (pcase (coding-system-eol-type buffer-file-coding-system)
                (0 "LF  ")
                (1 "CRLF  ")
                (2 "CR  "))
              (let ((sys (coding-system-plist buffer-file-coding-system)))
                (cond ((memq (plist-get sys :category) '(coding-category-undecided coding-category-utf-8))
                       "UTF-8")
                      (t (upcase (symbol-name (plist-get sys :name))))))
              " ")
    " "))

(def-modeline-segment! flycheck
  "Displays the flycheck status in the buffer with some nice icons."
  (when (bound-and-true-p flycheck-mode)
    (if (eq 'finished flycheck-last-status-change)
        (if flycheck-current-errors
            (let-alist (flycheck-count-errors flycheck-current-errors)
              (let ((sum (+ (or .error 0) (or .warning 0))))
                (if .error
                    (snow-modeline|get-icon
                     "circle-slash"
                     (number-to-string sum)
                     (if (active) 'snow-modeline-urgent))
                  (snow-modeline|get-icon
                   "alert"
                   (number-to-string sum)
                   (if (active) 'snow-modeline-warning)))))
          (snow-modeline|get-icon "check" nil 'snow-modeline-info))
      (snow-modeline|get-icon "sync" nil 'font-lock-doc-face))))

;;
;; Modelines
;;
(def-modeline! main
  (bar " " rocket  path " " flycheck)
  (buffer-encoding git " " major-mode buffer-position))


(defun snow-modeline|set-face ()
  "Set's the face of the modeline to look as stunning as it does :-]"
  (set-face-background 'mode-line "#39393D")
  (set-face-background 'mode-line-inactive "#232425"))

(defun snow-modeline|init ()
  "Create the modeline and set it as the default"
  (interactive)
  (setq-default mode-line-format nil)
  (snow-modeline|set-face) 
  ;; Set the actual modeline
  (snow-set-modeline 'main t))

(add-hook 'after-init-hook 'snow-modeline|init)

(provide 'modeline)
