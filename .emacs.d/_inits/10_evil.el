(require 'evil)
(setq evil-default-state 'emacs)
(defun evil-escape-or-quit (&optional prompt)
  (interactive)
  (cond
   ((or (evil-normal-state-p) (evil-insert-state-p)
        (evil-replace-state-p) (evil-visual-state-p)) [escape])
   (t (kbd "C-g"))))
(define-key key-translation-map (kbd "C-c") #'evil-escape-or-quit)
(define-key evil-operator-state-map (kbd "C-c") #'evil-escape-or-quit)
(define-key evil-normal-state-map [escape] #'keyboard-quit)

(evil-mode 1)

