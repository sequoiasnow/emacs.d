
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
; (package-initialize)

(require 'core (concat user-emacs-directory "core/core"))

(snow-add-languages
 "clojure"
 "haskell"
 "markdown"
 "swift"
 "typescript"
 "web")

(add-ui-element "neotree")

;; Use the only modeline available, spaceline
(use-modeline "spaceline")



