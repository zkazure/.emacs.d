;; (add-to-list 'load-path "~/.emacs.d/site-lisp/compat")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/llama")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/transient/lisp")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/with-editor/lisp")
;; (require 'compat)
;; (require 'llama)
;; (require 'transient)
;; (require 'with-editor)

(require 'magit)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list "~/.emacs.d/site-lisp/magit/docs/"))

(provide 'init-magit)
