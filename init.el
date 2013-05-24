(require 'cl)
(require 'package)

;; turn off mouse interface
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; turn off splash screen
(setq inhibit-startup-message t)

;; setup load paths
(setq core-dir (concat user-emacs-directory "core"))
(setq defuns-dir (concat user-emacs-directory "defuns"))
(setq elpa-dir (concat user-emacs-directory "elpa"))
(setq modules-dir (concat user-emacs-directory "modules"))
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path core-dir)
(add-to-list 'load-path defuns-dir)
(add-to-list 'load-path modules-dir)

;; mac setup
(setq is-mac (equal system-type 'darwin))
(when is-mac (require 'mac))
(setenv "PATH" (concatenate 'string
                            "/usr/local/bin:"
                            (shell-command-to-string "echo $PATH")))

;; Setup and install packages
(require 'setup-package-repo)
(require 'install-packages)
(require 'smooth-scrolling)

;; load functions
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file) (load file)))

;; load modules
(dolist (file (directory-files modules-dir t "\\w+"))
  (require (intern (file-name-from-path-no-ext file))))

;; hooks
(add-hook 'js-mode-hook 'whitespace-mode)

;; turn off autosave/backup
(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)
