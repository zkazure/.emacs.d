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

(global-hl-line-mode 1)

(set-face-attribute 'default nil
  		    :family "JetBrainsMono")

(add-to-list 'load-path "~/.emacs.d/site-lisp/dash/")
(require 'dash)
(add-to-list 'load-path "~/.emacs.d/site-lisp/posframe/")
(require 'posframe)

(add-to-list 'load-path "~/.emacs.d/site-lisp/rime/")
(require 'rime)

(setq rime-posframe-properties
      (list :background-color "#333333"
	    :foreground-color "#dcdcdc"
	    :internal-border-width 5))

(setq default-input-method "rime"
	rime-show-candidate 'posframe)

(setq rime-posframe-style 'vertical)

(add-to-list 'load-path "~/.emacs.d/site-lisp/rainbow-delimiters/")
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(add-to-list 'load-path "~/.emacs.d/site-lisp/which-key/")
(require 'which-key)
(setq which-key-idle-delay 0.5)
(which-key-mode)

(setq org-capture-templates nil)
(add-to-list 'org-capture-templates
	     '("j" "Journal" entry (file+weektree "~/Documents/org/journal.org")
	       "* %?"))
(add-to-list 'org-capture-templates
             '("i" "Inbox" entry (file "~/Documents/org/inbox.org")
               "* %U - %^{heading} %^g\n %?\n"))
(add-to-list 'org-capture-templates
             '("n" "Notes" entry (file "~/Documents/org/notes.org")
               "* %^{heading} %t %^g\n  %?\n"))
(add-to-list 'org-capture-templates
             '("r" "Book Reading Task" entry
               (file+olp "~/Documents/org/task.org" "Reading" "Book")
               "* TODO %^{书名}\n%u\n%a\n" :clock-in t :clock-resume t))
(add-to-list 'org-capture-templates
	     '("e" "English Learning" entry
	       (file+weektree "~/Documents/org/en-learn.org")
	       "* \n\n** 1\n%?"))
(add-to-list 'org-capture-templates
	     '("s" "self-improve" entry
	       (file+datetree "~/Documents/org/self-improve.org")
	       "* %?"))
(add-to-list 'org-capture-templates
	     '("v" "vlog" entry 
	       (file+weekly "~/Documents/org/record.org")
	       "* %U\n%?"))
(define-key global-map "\C-cc" 'org-capture)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (C . t)))

(global-visual-line-mode t)
(setq org-hide-leading-stars t)

(setq org-directory "~/Documents/org/")
(setq org-agenda-files '("~/Documents/org/"))
(setq org-agenda-start-with-log-mode t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-timestamp-if-done t)

(define-key global-map "\C-ca" 'org-agenda)

(add-to-list 'load-path "~/.emacs.d/site-lisp/olivetti/")
(require 'olivetti)
(define-key global-map "\C-co" 'olivetti-mode)

(add-to-list 'load-path "~/.emacs.d/site-lisp/org-tree-slide/")
(require 'org-tree-slide)

(define-key org-mode-map (kbd "<f8>") 'org-tree-slide-mode)
(define-key org-mode-map (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)

;; (when (require 'org-tree-slide nil t)
;;   (global-set-key (kbd "<f8>") 'org-tree-slide-mode)
;;   (global-set-key (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)
;;   (org-tree-slide-simple-profile))

(with-eval-after-load "org-tree-slide"
  (define-key org-tree-slide-mode-map (kbd "<f9>") 'org-tree-slide-move-previous-tree)
  (define-key org-tree-slide-mode-map (kbd "<f10>") 'org-tree-slide-move-next-tree)
  )

(add-to-list 'load-path "~/.emacs.d/site-lisp/aweshell/")
(require 'aweshell)
(define-key global-map "\C-ce" 'aweshell-toggle)

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
	       'org-mode-hook
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

;; (define-key fingertip-mode-map (kbd "M-o") 'fingertip-backward-delete)
;; (define-key fingertip-mode-map (kbd "C-d") 'fingertip-forward-delete)
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
(setq lsp-bridge-enable-org-babel t)

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

(add-to-list 'load-path "~/.emacs.d/site-lisp/dirvish/")
(require 'dirvish)
(define-key global-map "\C-xd" 'dirvish)
(define-key dired-mode-map (kbd "b") 'dired-up-directory)

(add-to-list 'load-path "~/.emacs.d/site-lisp/avy/")
(require 'avy)

(global-set-key (kbd "C-:") 'avy-goto-char-2)
(global-set-key (kbd "C-'") 'avy-goto-char)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

(avy-setup-default)
(global-set-key (kbd "C-c C-j") 'avy-resume)

(add-to-list 'load-path "~/.emacs.d/site-lisp/ace-window/")
(require 'ace-window)

(global-set-key (kbd "M-o") 'ace-window)

;; (setq aw-'keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(setq aw-scope 'frame)
(setq aw-background nil)
(setq aw-dispatch-always t)

(setopt aw-dispatch-alist
  '((?d aw-delete-window "Delete Window")
    (?o aw-delete-other-windows "Delete Other Winsdows")
    (?v aw-split-window-vert "Split Vert Window")
    (?h aw-split-window-horz "Split Horz Window")
    (?j aw-switch-buffer-in-window "Select Buffer")
    (?s aw-swap-window "Swap Windows")
    (?m aw-move-window "Move Window")
;;    (?c aw-copy-window "Copy Window")
;;    (?u aw-switch-buffer-other-window "Switch Buffer Other Window")
;;    (?n aw-flip-window)
;;    (?z aw-split-window-fair "Split Fair Window")
    (?? aw-show-dispatch-help)))

(add-to-list 'load-path "~/.emacs.d/site-lisp/colorful-mode/")
(require 'colorful-mode)

(setq colorful-use-prefix t)
(setq colorful-only-strings 'only-prog)
(setq css-fontify-colors nil)

(global-colorful-mode t)
(add-to-list 'global-colorful-modes 'helpful-mode)

(add-to-list 'load-path "~/.emacs.d/site-lisp/projectile/")
(require 'projectile)

(projectile-mode +1)
;; Recommended keymap prefix on Windows/Linux
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)



(add-hook 'org-mode-hook 'org-toggle-pretty-entities)

(add-to-list 'load-path "~/.emacs.d/site-lisp/auctex/")
(require 'auctex)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master t)

(add-hook 'LaTeX-mode-hook 'prettify-symbols-mode)

(add-hook 'LaTeX-mode-hook
          (defun preview-larger-previews ()
            (setq preview-scale-function
                  (lambda () (* 1.25
                           (funcall (preview-scale-from-face)))))))
(setq prettify-symbols-unprettify-at-point t)

(add-to-list 'load-path "~/.emacs.d/site-lisp/cdlatex/")
(require 'cdlatex)

(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

(defun my/yas-try-expanding-auto-snippets ()
  (when (and (boundp 'yas-minor-mode)
	     yas-minor-mode)
    (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
      (yas-expand))))

;; Try after every insertion
(add-hook 'post-self-insert-hook #'my/yas-try-expanding-auto-snippets)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(add-hook 'LaTeX-mode-hook 'outline-minor-mode)
(add-hook 'LaTeX-mode-hook 'outline-hide-body)

;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1)
;;   :custom ((doom-modelien-height 15)))

(provide 'init)
