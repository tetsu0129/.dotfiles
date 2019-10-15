;; --- helm_cfg.el ---

(require 'helm-config)
(helm-mode 1)

;; C-hで前の文字削除
;(define-key helm-map (kbd "C-h") 'delete-backward-char)
;(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;; キーバインド
;(define-key global-map (kbd "C-x b")   'helm-buffers-list)
(define-key global-map (kbd "C-x b") 'helm-for-files)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
;(define-key helm-find-files-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-x C-a") 'helm-select-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
