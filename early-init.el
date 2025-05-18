(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.6)

(setq package-enable-at-startup nil)
(setq package-quickstart nil)

(setq frame-inhibit-implied-resize t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(setq use-file-dialog nil)

(provide 'early-init)
