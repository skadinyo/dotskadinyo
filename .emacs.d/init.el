(setq make-backup-files nil)
(setq auto-save-default nil)

(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(add-to-list 'default-frame-alist '(font . "Monospace-14:weight=normal"))
(set-face-attribute 'default t :font "Monospace-14:weight=normal")

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(paredit
    clojure-mode
    expand-region
    clojure-mode-extra-font-locking
    cider
    ido-ubiquitous
    smex
    projectile
    rainbow-delimiters
    tagedit
    magit))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;;
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file

;;;;
;; Customization
;;;;
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

(load "navigation.el")
(load "ui.el")
(load "editing.el")
(load "misc.el")
;;(load "firacode.el")
(load "elisp-editing.el")
;; Language-specific
(load "setup-clojure.el")
(load "setup-js.el")

;; load tabbar
;;(add-to-list 'load-path "~/dotskadinyo/module/tabbar")
;;(require 'tabbar)
;;(tabbar-mode t)

