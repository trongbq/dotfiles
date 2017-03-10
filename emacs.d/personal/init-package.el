;;; init-package.el --- Load and config packages

(package-initialize)
(require 'package)
(setq package-enable-at-startup nil)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))


;;(use-package zenburn-theme :ensure t :defer t)
;;(load-theme 'zenburn t)
(use-package gruvbox-theme :ensure t)
(load-theme 'gruvbox)

;;; status line
(use-package powerline
  :ensure t)

(use-package smart-mode-line-powerline-theme
  :ensure t)

(use-package smart-mode-line
  :ensure t
  :config
  (require 'powerline)
  (setq powerline-default-separator 'arrow-fade)
  (setq sml/theme 'powerline)
  (sml/setup)
  ;; These colors are more pleasing (for gruvbox)
  (custom-theme-set-faces
   'user
   '(powerline-evil-normal-face ((t (:inherit powerline-evil-base-face :background "chartreuse3"))))
   '(sml/folder ((t (:inherit sml/global :background "grey22" :foreground "grey50" :weight normal))) t)
   '(sml/git ((t (:background "grey22" :foreground "chartreuse3"))) t)))


(use-package helm
  :ensure t
  :diminish helm-mode
  :commands helm-mode
  :config
  (helm-mode 1)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action))
(global-set-key (kbd "C-c b") 'helm-buffers-list)
(global-set-key (kbd "C-c o") 'helm-find-files)
(global-set-key (kbd "C-c f") 'helm-find)

(use-package ag
  :ensure t
  :commands (ag ag-project)
  :config
  (add-hook 'ag-mode-hook
	    (lambda ()
	      (define-key ag-mode-map (kbd "n") 'evil-search-next)
	      (define-key ag-mode-map (kbd "N") 'evil-search-previous)))
  (setq ag-executable "/usr/bin/ag")
  (setq ag-highlight-search t)
  (setq ag-reuse-buffers t)
  (setq ag-reuse-window t))
(global-set-key (kbd "C-c s") 'helm-ag)

(use-package helm-ag
  :ensure t)

(use-package flx-ido
  :ensure t)

(provide 'init-package)
;;; init-package.el ends here
