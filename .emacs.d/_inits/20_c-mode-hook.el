;; indent with four space.
(add-hook 'c-mode-hook
          '(lambda ()
             (setq c-basic-offset 4)
             (setq indent-tabs-mode nil)
             (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
             (electric-pair-mode)
             (require 'auto-highlight-symbol)
             (auto-highlight-symbol-mode t)
             ))

;; use helm-gtags-mode.
(add-hook 'c-mode-hook 'helm-gtags-mode)

;; auto insert match parenthese
(defun my-local-electric-pair-mode ()
  (make-variable-buffer-local 'electric-pair-mode)
  (electric-pair-mode +1))
(add-hook 'c-mode-hook 'my-local-electric-pair-mode)

(require 'zjl-hl)
(zjl-hl-enable-global-all-modes)
