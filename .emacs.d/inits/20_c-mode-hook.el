;; indent with four space.
(add-hook 'c-mode-hook
          '(lambda ()
             (setq c-basic-offset 4)
             (setq indent-tabs-mode nil)))

;; use helm-gtags-mode.
(add-hook 'c-mode-hook 'helm-gtags-mode)
