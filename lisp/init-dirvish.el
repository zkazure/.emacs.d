(require 'dirvish)
(define-key global-map "\C-xd" 'dirvish)
(define-key dired-mode-map (kbd "b") 'dired-up-directory)

(provide 'init-dirvish)
