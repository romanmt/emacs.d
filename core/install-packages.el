;; Add in your own as you wish:
(defvar my-packages '(
                      starter-kit 
                      starter-kit-lisp
                      starter-kit-js 
                      starter-kit-bindings
                      wrap-region
                      ace-jump-mode
                      sr-speedbar
                      color-theme-sanityinc-tomorrow
                      sws-mode
                      jade-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
(defun file-name-from-path-no-ext (file)
    (file-name-sans-extension (file-name-nondirectory file)))

(provide 'install-packages)
