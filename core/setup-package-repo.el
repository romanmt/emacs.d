;; setup marmalade package repository
(defvar marmalade '("marmalade" . "http://marmalade-repo.org/packages/"))
(defvar melpa '("melpa" . "http://melpa.milkbox.net/packages/"))

(add-to-list 'package-archives melpa t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(provide 'setup-package-repo)
