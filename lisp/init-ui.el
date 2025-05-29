(setq visible-bell t)

;; display column number in the modeline
(column-number-mode)

;; display line numbers and disable in some mode
(global-display-line-numbers-mode t)

;; turn of the line numebr in the terminal
;; why it is useless
;; (dolist (mode '(org-mode-hook
;;                 term-mode-hook
;;                 shell-mode-hook
;;                 eshell-mode-hook))
;;   (add-hook mode (lambda () (display-line-numbers-mode 0))))

(provide 'init-ui)
