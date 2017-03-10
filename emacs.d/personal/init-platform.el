;;; platform.el --- Platform specific settings

(require 'init-font)

;; This must run after window setup or it seems to have no effect.
(add-hook 'window-setup-hook
	  (lambda ()
	    (when (memq window-system '(mac ns))
	      (add-to-list 'default-frame-alist '(font . "Hack"))
	      (set-face-attribute 'default nil :font "Hack")
	      (sanityinc/set-frame-font-size 14)
	      (define-key global-map (kbd "<s-return>") 'toggle-frame-fullscreen))

	    (when (memq window-system '(x))
	      (add-to-list 'default-frame-alist '(font . "Hack"))
	      (set-face-attribute 'default nil :font "Hack")
	      (sanityinc/set-frame-font-size 14))

	    (when (fboundp 'powerline-reset)
	      (powerline-reset))))

(provide 'init-platform)
;;; platform.el ends here
