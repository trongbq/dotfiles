(add-to-list 'load-path "~/.emacs.d/lisp/")

;; https://github.com/raxod502/straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Splash Screen
(setq inhibit-startup-screen t)
(setq initial-scratch-message ";; Happy Hacking")

;; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)
(global-linum-mode 1)
(add-to-list 'default-frame-alist '(font . "SF Mono-13"))
(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))

(setq-default word-wrap t)

;; Disable backup and autosave files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Org-mode
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "WAITING" "|" "DONE")))
(setq org-todo-keyword-faces
      '(("TODO"    . "grey")
        ("DOING"   . "#fdcb6e")
        ("WAITING"    . "#ff7675")
        ("DONE"    . "green")))
(setq org-log-done 'note)
(setq org-time-stamp-custom-formats '("<%a %D>" . "<%a %b %e %Y %H:%M>"))
(with-eval-after-load 'org
  (setq org-startup-indented t) ; Enable `org-indent-mode' by default
  (add-hook 'org-mode-hook #'visual-line-mode))

(setq org-src-fontify-natively t)

(require 'ox-confluence)

;; Key binding
(global-set-key (kbd "C-c l")
                (lambda () (interactive) (find-file "~/workspace/documents/line/todo.org")))
(global-set-key (kbd "C-c p")
                (lambda () (interactive) (find-file "~/workspace/documents/datacenter/README.org")))
(global-set-key (kbd "C-c c") 'org-capture)


;; Package manager
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package org-download
  :after org
  :bind)

(use-package evil
  :ensure t ;; install the evil package if not installed
  :init ;; tweak evil's configuration before loading it
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
  :config ;; tweak evil after loading it
  (evil-mode))

(use-package ledger-mode
    :ensure t
    :init
    :config
    (setq ledger-binary-path "/usr/local/bin/ledger"
	ledger-mode-should-check-version nil)
    :mode ("\\.dat\\'"
           "\\.ledger\\'")
    :custom (ledger-clear-whole-transactions t))

(use-package company
:ensure t
:init
(setq company-minimum-prefix-length 3)
(setq company-auto-complete nil)
(setq company-idle-delay 0)
(setq company-require-match 'never)
(setq company-frontends
  '(company-pseudo-tooltip-unless-just-one-frontend
    company-preview-frontend
    company-echo-metadata-frontend))
(setq tab-always-indent 'complete)
(defvar completion-at-point-functions-saved nil)
:config
(global-company-mode 1)
(define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
(define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
(define-key company-active-map (kbd "S-TAB") 'company-select-previous)
(define-key company-active-map (kbd "<backtab>") 'company-select-previous)
(define-key company-mode-map [remap indent-for-tab-command] 'company-indent-for-tab-command)
(defun company-indent-for-tab-command (&optional arg)
  (interactive "P")
  (let ((completion-at-point-functions-saved completion-at-point-functions)
    	(completion-at-point-functions '(company-complete-common-wrapper)))
	(indent-for-tab-command arg)))

(defun company-complete-common-wrapper ()
	(let ((completion-at-point-functions completion-at-point-functions-saved))
	(company-complete-common))))

;; Flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(adwaita))
 '(ledger-reports
   '(("balance" "ledger balance")
     ("bal" "%(binary) -f %(ledger-file) bal")
     ("reg" "%(binary) -f %(ledger-file) reg")
     ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
     ("account" "%(binary) -f %(ledger-file) reg %(account)"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
