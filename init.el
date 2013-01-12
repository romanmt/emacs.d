(require 'cl)
(require 'package)

;; turn off mouse interface
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; turn off splash screen
(setq inhibit-startup-message t)

;; turn off autosave/backup
(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)

;; setup load paths
(setq core-dir (concat user-emacs-directory "core"))
(setq elpa-dir (concat user-emacs-directory "elpa"))
(setq modules-dir (concat user-emacs-directory "modules"))
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path core-dir)
(add-to-list 'load-path modules-dir)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(require 'install-packages)

;; load modules
(dolist (file (directory-files modules-dir t "\\w+"))
  (require (intern (file-name-from-path-no-ext file))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'sanityinc-tomorrow-eighties)

