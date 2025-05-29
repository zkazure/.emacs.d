(setq org-hide-emphasis-markers t)

(require 'org-appear)
(add-hook 'org-mode-hook 'org-appear-mode)

(provide 'init-org-appear)
