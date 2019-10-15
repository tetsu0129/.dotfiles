;; --- helm_gtags_cfg.el ---
(require 'helm-gtags)

;; key bindings.
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
             (local-set-key (kbd "M-T") 'helm-gtags-find-tag-other-window)
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
             (local-set-key (kbd "M-S") 'helm-gtags-show-stack)
             (local-set-key (kbd "M-R") 'helm-gtags-resume)
             (local-set-key (kbd "M-c") 'helm-gtags-clear-stack)
             (local-set-key (kbd "M-*") 'helm-gtags-pop-stack)))
