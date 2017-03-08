;; Package manager
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; UI
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'railscasts t nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

(set-default-font "Inconsolata 12")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Editing
(global-linum-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Key bindings
(global-set-key (kbd "M-o") 'other-window)    ;; switch between windows
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Mode or package config
(ac-config-default)    ;; audo-complete config
;;(windmove-default-keybindings)    ;; enable cardinal direction

;; Enable ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Installed packages
;; - auto-complete
