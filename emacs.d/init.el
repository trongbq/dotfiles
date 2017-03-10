;;; init.el

;; Keep automated customizations in a separated file
(setq custom-file "~/.emacs.d/personal/custom.el")
(load custom-file 'noerror)

(add-to-list 'load-path (expand-file-name "personal" user-emacs-directory))

(let ((files (directory-files-and-attributes "~/.emacs.d/personal" t)))
	(dolist (file files)
		(let ((filename (car file))
					(dir (nth 1 file)))
			(when (and dir
								 (not (string-suffix-p "." filename)))
				(add-to-list 'load-path (car file))))))

(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))

(require 'defuns)
(require 'init-global)
(require 'init-elpa)
(require 'init-font)
(require 'init-platform)
(require 'init-package)
