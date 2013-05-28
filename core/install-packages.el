(defun init--install-packages ()
  (packages-install
   (cons 'ace-jump-mode melpa)
   (cons 'ack-and-a-half melpa)
   (cons 'ag melpa)
   (cons 'change-inner melpa)
   (cons 'clojure-mode melpa)
   (cons 'clojure-snippets melpa)
   (cons 'clojure-test-mode melpa)
   (cons 'color-theme-sanityinc-tomorrow melpa)
   (cons 'icicles melpa)
   (cons 'jade-mode melpa)
   (cons 'js2-mode melpa)   
   (cons 'magit melpa)
   (cons 'smooth-scrolling melpa)
   (cons 'sr-speedbar melpa)
   (cons 'sws-mode melpa)
   (cons 'wrap-region melpa)
   (cons 'yasnippet melpa)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

(provide 'install-packages)
