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

;;(use-package zenburn-theme
;;  :ensure t
;;  :defer t)
;;  :config(load-theme 'zenburn t))
(use-package gruvbox-theme
  :ensure t
  :config(load-theme 'gruvbox))

(use-package smart-mode-line
  :ensure t
  :config
  (sml/setup))

(use-package helm
  :ensure t
  :diminish helm-mode
  :commands helm-mode
  :config
  (helm-mode 1)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  :bind (("C-c b" . helm-buffers-list)
	 ("C-c o" . helm-find-files)
	 ("C-c f" . helm-find)))

(use-package helm-ag
  :ensure t
  :bind (("C-c C-s" . helm-ag)
	 ("C-c s" . helm-ag-this-file)))

(use-package flx
  :ensure t)

(use-package flx-ido
  :ensure t)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(provide 'init-package)
;;; init-package.el ends here
