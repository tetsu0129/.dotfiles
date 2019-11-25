;;;;; basic configurations

;;;; disables
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(setq-default indent-tabs-mode nil) ;; indent with spaces
(setq inhibit-startup-message t)

;;;; enables
(show-paren-mode t)  ;; emphasize parenthesis
(setq kill-whole-line t)
(setq display-time-24hr-format t)
(define-key global-map (kbd "C-c") (make-sparse-keymap))  ;; make C-c prefix key
;;; line-numbers
;; (global-display-line-numbers-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)
(set-face-background 'line-number "gray16")
(set-face-foreground 'line-number "DimGray")
(set-face-foreground 'line-number-current-line "LightGray")

;;;; key assgins (emacs functions)
(keyboard-translate ?\C-h ?\C-?)
(global-set-key (kbd "C-x l") 'goto-line)
(global-set-key (kbd "C-x L") 'load-file)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-a") 'backward-list)
(global-set-key (kbd "M-e") 'forward-list)
(global-set-key (kbd "C-q") 'query-replace)
(global-set-key (kbd "<C-tab>") 'quoted-insert)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "M-h") 'delete-backward)

;;;; key assigns (original functions)
(global-set-key (kbd "M-k") 'copy-whole-line)
(global-set-key (kbd "C-M-x") 'copy-file-name-to-clipboard)
(global-set-key (kbd "C-M-c") 'copy-file-path-to-clipboard)
(global-set-key (kbd "C-M-g") 'copy-file-name-and-line-to-clipboard)
(global-set-key (kbd "C-c C-r") 'window-resizer)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c k") 'windmove-up)
(global-set-key (kbd "C-x h") 'split-window-horizontally-n)
(global-set-key (kbd "C-x v") 'split-window-vertically-n)
(global-set-key (kbd "C-M-d") 'delete-forward-operator)
(global-set-key (kbd "C-M-h") 'delete-backward-operator)
(global-set-key (kbd "M-o")   'newline-next)
(global-set-key (kbd "C-M-o") 'newline-previous)

;;;; basic mode-hooks settings
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (my-local-electric-pair-mode)))

(add-hook 'c-mode-hook
          '(lambda ()
             (setq c-basic-offset 4)
             (setq indent-tabs-mode nil)
             (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
             (define-key c-mode-map (kbd "C-M-h") 'delete-backward-operator)
             (my-local-electric-pair-mode)))

(add-hook 'c++-mode-hook
          '(lambda ()
             (setq c-basic-offset 4)
             (setq indent-tabs-mode nil)
             (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
             (define-key c++-mode-map (kbd "C-M-h") 'delete-backward-operator)
             (my-local-electric-pair-mode)))

(setq auto-mode-alist
      (append '(("\\.pc$" . c-mode)
                ("\\.edl$" . c-mode))
              auto-mode-alist))
