;; --- package_cfg.el ---
(require 'package)

;; add archives url.
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;; package initialization.
(package-initialize)
