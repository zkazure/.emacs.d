;; garbage collection
(setq gc-cons-threshold (* 128 1024 1024))

;; ??? Process performance tuning
(setq read-process-output-max (* 4 1024 1024))
(setq process-adaptive-read-buffering nil)

;; add you personal config
(dolist (dir '("lisp" "site-lisp" "test-lisp"))
  (push (expand-file-name dir user-emacs-directory) load-path))
;; add the subdirectory
(dolist (dir '("site-lisp" "test-lisp"))
  (let ((default-directory (expand-file-name dir user-emacs-directory)))
    (normal-top-level-add-subdirs-to-load-path))) ;;how this work

(provide 'init)
