(require 'auctex)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master t)

(add-hook 'LaTeX-mode-hook 'prettify-symbols-mode)
(add-hook 'latex-mode-hook 'prettify-symbols-mode)

(add-hook 'LaTeX-mode-hook
          (defun preview-larger-previews ()
            (setq preview-scale-function
                  (lambda () (* 1.25
                           (funcall (preview-scale-from-face)))))))
(add-hook 'latex-mode-hook
          (defun preview-larger-previews ()
            (setq preview-scale-function
                  (lambda () (* 1.25
                           (funcall (preview-scale-from-face)))))))

(setq prettify-symbols-unprettify-at-point t)

(require 'cdlatex)

(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(add-hook 'latex-mode-hook 'turn-on-cdlatex)

(defun my/yas-try-expanding-auto-snippets ()
  (when (and (boundp 'yas-minor-mode)
	     yas-minor-mode)
    (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
      (yas-expand))))

;; Try after every insertion
(add-hook 'post-self-insert-hook #'my/yas-try-expanding-auto-snippets)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'latex-mode-hook 'turn-on-reftex)

(provide 'init-latex)
