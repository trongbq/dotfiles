;;; init-global.el --- Global settings

;; Don't show the startup screen
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight regions and add special behaviors to regions.
(setq transient-mark-mode t)
(pending-delete-mode t)

;; Display line and column numbers
(setq column-number-mode  t)
(global-linum-mode t)

;; Disable scroll bars, menu bar, tool bar
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(menu-bar-mode -1)
(tool-bar-mode -1)

;; tab
(setq tab-width 2)

;; Explicitly show the end of a buffer
(setq-default indicate-empty-lines t)

;; Prevent the annoying beep on errors
(setq visible-bell t)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Show matching parens
(show-paren-mode t)

;; switch between windows
(global-set-key (kbd "M-o") 'other-window)

;; Don't truncate lines
(setq truncate-lines t)
(setq truncate-partial-width-windows nil)

;; Trailing whitespace is unnecessary
(defvar whitespace-cleanup-on-save t)
;; (setq whitespace-cleanup-on-save nil)
(add-hook 'before-save-hook
	  (lambda ()
	    (if whitespace-cleanup-on-save (whitespace-cleanup))))

(provide 'init-global)
;;; init-global.el ends here
