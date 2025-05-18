(setq inhibit-startup-message t)

(tooltip-mode -1)
(set-fringe-mode 10)

(setq visible-bell t)

(column-number-mode)
(global-display-line-numbers-mode t)
;; turn of the line numebr in the terminal
;; why it is useless
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq make-backup-files nil)

(load-theme 'modus-operandi-tinted)

(add-to-list 'load-path "~/.emacs.d/site-lisp/dash/")
(require 'dash)

(add-to-list 'load-path "~/.emacs.d/site-lisp/rime/")
(require 'rime)
(setq rime-posframe-style 'vertical)
(setq default-input-method "rime")

(add-to-list 'load-path "~/.emacs.d/site-lisp/rainbow-delimiters/")
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(add-to-list 'load-path "~/.emacs.d/site-lisp/which-key/")
(require 'which-key)
(setq which-key-idle-delay 0.5)
(which-key-mode)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))

(add-to-list 'load-path "~/.emacs.d/site-lisp/ivy/")
(require 'ivy)
(require 'swiper)
(require 'counsel)
(ivy-mode)
(setopt ivy-use-virtual-buffers t)
(setopt enable-recursive-minibuffers t)
;; Enable this if you want `swiper' to use it:
;; (setopt search-default-mode #'char-fold-to-regexp)
(keymap-global-set "C-s" #'swiper-isearch)
(keymap-global-set "C-c C-r" #'ivy-resume)
(keymap-global-set "<f6>" #'ivy-resume)
(keymap-global-set "M-x" #'counsel-M-x)
(keymap-global-set "C-x C-f" #'counsel-find-file)
(keymap-global-set "<f1> f" #'counsel-describe-function)
(keymap-global-set "<f1> v" #'counsel-describe-variable)
(keymap-global-set "<f1> o" #'counsel-describe-symbol)
(keymap-global-set "<f1> l" #'counsel-find-library)
(keymap-global-set "<f2> i" #'counsel-info-lookup-symbol)
(keymap-global-set "<f2> u" #'counsel-unicode-char)
(keymap-global-set "C-c g" #'counsel-git)
(keymap-global-set "C-c j" #'counsel-git-grep)
(keymap-global-set "C-c k" #'counsel-ag)
(keymap-global-set "C-x l" #'counsel-locate)
(keymap-global-set "C-S-o" #'counsel-rhythmbox)
(keymap-set minibuffer-local-map "C-r" #'counsel-minibuffer-history)

(add-to-list 'load-path "~/.emacs.d/site-lisp/yasnippet/")
(require 'yasnippet)
(yas-global-mode 1)

(add-to-list 'load-path "~/.emacs.d/site-lisp/eaf/")
(require 'eaf)
(require 'eaf-git)

;; agenda
;; (setq org-agenda-files '("~/Documents/org/agenda.org"))

;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1)
;;   :custom ((doom-modelien-height 15)))

(provide 'init)
