(global-visual-line-mode t)
(setq org-hide-leading-stars t)
(add-hook 'org-mode-hook 'org-num-mode)

(with-eval-after-load 'org
  ;; Make verbatim with highlight text background.
  (add-to-list 'org-emphasis-alist
               '("=" (:background "#ffee11")))
  ;; Make deletion (obsolete) text foreground with dark gray.
  (add-to-list 'org-emphasis-alist
               '("+" (:foreground "dark gray"
                     :strike-through t)))
  ;; Make code style around with box.
  (add-to-list 'org-emphasis-alist
               '("~" (:box (:line-width 2
                             :color "grey75"
                             :style released-button)))))

(define-key global-map "\C-ca" 'org-agenda)

(setq org-agenda-window-setup 'current-window)

(setq org-directory "~/Documents/org/")
(setq org-agenda-files '("~/Documents/org/agenda/"))

(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-timestamp-if-done t)

;; ??? what is this
(setq org-agenda-start-with-log-mode t)

(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates nil)

(add-to-list 'org-capture-templates
	     '("j" "Journal" entry (file+weektree "~/Documents/org/journal/journal.org")
	       "* %?"))
(add-to-list 'org-capture-templates
             '("i" "Inbox" entry (file "~/Documents/org/inbox.org")
               "* %?\n"))
(add-to-list 'org-capture-templates
             '("n" "Notes" entry (file "~/Documents/org/notes.org")
               "* %^{heading} %t %^g\n  %?\n"))
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
	       (file+weektree "~/Documents/org/record.org")
	       "* %?")) ;; C-c C-x C-i to start record C-c C-x C-o to end itt

(provide 'init-org)

(setq org-yank-image-file-name-function 'org-yank-image-read-filename)
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-M-y") 'yank-media)
  (define-key org-mode-map (kbd "C-M-Y") 'yank-media-types))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (C . t)))

(setq org-hide-emphasis-markers t)

(require 'org-appear)
(add-hook 'org-mode-hook 'org-appear-mode)

(require 'olivetti)
(define-key global-map "\C-co" 'olivetti-mode)

(provide 'init-org)
