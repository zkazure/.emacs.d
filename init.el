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

(setq org-startup-indented t)

(setq org-directory "~/Documents/org/")
(setq org-agenda-files '("~/Documents/org/"))
(setq org-agenda-start-with-log-mode t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-timestamp-if-done t)

(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

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

(add-to-list 'load-path "~/.emacs.d/site-lisp/fingertip/")
  (require 'fingertip)


  (dolist (hook (list
                 'c-mode-common-hook
                 'c-mode-hook
                 'c++-mode-hook
                 'java-mode-hook
                 'haskell-mode-hook
                 'emacs-lisp-mode-hook
                 'lisp-interaction-mode-hook
                 'lisp-mode-hook
                 'maxima-mode-hook
                 'ielm-mode-hook
                 'sh-mode-hook
                 'makefile-gmake-mode-hook
                 'php-mode-hook
                 'python-mode-hook
                 'js-mode-hook
                 'go-mode-hook
                 'qml-mode-hook
                 'jade-mode-hook
                 'css-mode-hook
                 'ruby-mode-hook
                 'coffee-mode-hook
                 'rust-mode-hook
                 'rust-ts-mode-hook
                 'qmake-mode-hook
                 'lua-mode-hook
                 'swift-mode-hook
                 'web-mode-hook
                 'markdown-mode-hook
                 'llvm-mode-hook
                 'conf-toml-mode-hook
                 'nim-mode-hook
                 'typescript-mode-hook
                 'c-ts-mode-hook
                 'c++-ts-mode-hook
                 'cmake-ts-mode-hook
                 'toml-ts-mode-hook
                 'css-ts-mode-hook
                 'js-ts-mode-hook
                 'json-ts-mode-hook
                 'python-ts-mode-hook
                 'bash-ts-mode-hook
                 'typescript-ts-mode-hook
                 ))
    (add-hook hook #'(lambda () (fingertip-mode 1))))

(define-key fingertip-mode-map (kbd "(") 'fingertip-open-round)
(define-key fingertip-mode-map (kbd "[") 'fingertip-open-bracket)
(define-key fingertip-mode-map (kbd "{") 'fingertip-open-curly)
(define-key fingertip-mode-map (kbd ")") 'fingertip-close-round)
(define-key fingertip-mode-map (kbd "]") 'fingertip-close-bracket)
(define-key fingertip-mode-map (kbd "}") 'fingertip-close-curly)
(define-key fingertip-mode-map (kbd "=") 'fingertip-equal)

(define-key fingertip-mode-map (kbd "（") 'fingertip-open-chinese-round)
(define-key fingertip-mode-map (kbd "「") 'fingertip-open-chinese-bracket)
(define-key fingertip-mode-map (kbd "【") 'fingertip-open-chinese-curly)
(define-key fingertip-mode-map (kbd "）") 'fingertip-close-chinese-round)
(define-key fingertip-mode-map (kbd "」") 'fingertip-close-chinese-bracket)
(define-key fingertip-mode-map (kbd "】") 'fingertip-close-chinese-curly)

(define-key fingertip-mode-map (kbd "%") 'fingertip-match-paren)
(define-key fingertip-mode-map (kbd "\"") 'fingertip-double-quote)
(define-key fingertip-mode-map (kbd "'") 'fingertip-single-quote)

(define-key fingertip-mode-map (kbd "SPC") 'fingertip-space)
(define-key fingertip-mode-map (kbd "RET") 'fingertip-newline)

(define-key fingertip-mode-map (kbd "M-o") 'fingertip-backward-delete)
(define-key fingertip-mode-map (kbd "C-d") 'fingertip-forward-delete)
(define-key fingertip-mode-map (kbd "C-k") 'fingertip-kill)

(define-key fingertip-mode-map (kbd "M-\"") 'fingertip-wrap-double-quote)
(define-key fingertip-mode-map (kbd "M-'") 'fingertip-wrap-single-quote)
(define-key fingertip-mode-map (kbd "M-[") 'fingertip-wrap-bracket)
(define-key fingertip-mode-map (kbd "M-{") 'fingertip-wrap-curly)
(define-key fingertip-mode-map (kbd "M-(") 'fingertip-wrap-round)
(define-key fingertip-mode-map (kbd "M-)") 'fingertip-unwrap)

(define-key fingertip-mode-map (kbd "M-p") 'fingertip-jump-right)
(define-key fingertip-mode-map (kbd "M-n") 'fingertip-jump-left)
(define-key fingertip-mode-map (kbd "M-:") 'fingertip-jump-out-pair-and-newline)

(define-key fingertip-mode-map (kbd "C-j") 'fingertip-jump-up)

(add-to-list 'load-path "~/.emacs.d/site-lisp/markdown-mode/")
(require 'markdown-mode)

(add-to-list 'load-path "~/.emacs.d/site-lisp/lsp-bridge/")
(require 'lsp-bridge)
(global-lsp-bridge-mode)

(add-to-list 'load-path "~/.emacs.d/site-lisp/compat")
(add-to-list 'load-path "~/.emacs.d/site-lisp/llama")
(add-to-list 'load-path "~/.emacs.d/site-lisp/transient/lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/with-editor/lisp")
(require 'compat)
(require 'llama)
(require 'transient)
(require 'with-editor)

(add-to-list 'load-path "~/.emacs.d/site-lisp/magit/lisp")
(require 'magit)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list "~/.emacs.d/site-lisp/magit/docs/"))

;; agenda
;; (setq org-agenda-files '("~/Documents/org/agenda.org"))

;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1)
;;   :custom ((doom-modelien-height 15)))

(provide 'init)
