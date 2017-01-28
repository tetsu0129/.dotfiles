;; --- init.el ---

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; ~/.emacs.d/site-lisp 以下全部読み込み
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'init-loader)
;(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

;; add elisp directory paths to the load-path.
;; (add-to-list 'load-path "~/.emacs.d/site-lisp")

;; load configurations.
;; (load "package_cfg")
;; (load "basic")
;; (load "linum_cfg")
;; (load "whitespace_cfg")
;; (load "color_theme_cfg")
;; (load "woman_cfg")
;; (load "helm_cfg")
;; (load "sr_speedbar_cfg")
;; (load "company_cfg")
;; (load "c_mode_hook")

;; These are configurations which were make by emacs automatically.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (color-theme sr-speedbar init-loader ggtags company helm-gtags helm)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ricty Diminished" :foundry "outline" :slant normal :weight normal :height 143 :width normal)))))
