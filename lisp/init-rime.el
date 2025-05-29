(require 'dash)
(require 'posframe)
(require 'rime)

;; (setq rime-posframe-properties
;;       (list :background-color "#333333"
;;   	  :foreground-color "#dcdcdc"
;;   	  :internal-border-width 5))

(setq default-input-method "rime"
      rime-show-candidate 'posframe)

(setq rime-posframe-style 'vertical)

(provide 'init-rime)
