;; basic configurations.

;; hide menu and tool bar.
(menu-bar-mode 0)
(tool-bar-mode 0)

;; バックアップファイルを作成しない
(setq make-backup-files nil)
(setq auto-save-default nil)

;; 括弧強調表示
(show-paren-mode t)

;; C-h で Backspace
(keyboard-translate ?\C-h ?\C-?)

;; C-k で 行毎削除
(setq kill-whole-line t)

;; copy a line
(global-set-key "\M-k" 'copy-whole-line)

;; C-x l で goto-line
(global-set-key "\C-xl" 'goto-line)

;; C-x L で load-file
;(global-set-key "\C-xL" 'load-file)

;; M-p, M-n で 段落単位での移動
(global-set-key "\M-p" 'backward-paragraph)
(global-set-key "\M-n" 'forward-paragraph)

;; M-a, M-e で対応する括弧に移動
(global-set-key "\M-a" 'backward-list)
(global-set-key "\M-e" 'forward-list)

;; C-q で query-replace
(global-set-key "\C-q" 'query-replace)

;; C-c で リージョンの文字数カウント
(global-set-key "\C-c" 'count-lines-region)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; quoted-insert by C-tab.
(global-set-key (kbd "<C-tab>") 'quoted-insert)

;; indent with spaces.
(setq-default indent-tabs-mode nil)

;; highlight current line.
(defface my-hl-line-face
  '((((class color) (background dark))
     (:background "grey8" t))
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode -1)

;; move to the other window by M-o.
(global-set-key "\M-o" 'other-window)

;; display time.
(setq display-time-24hr-format t)
(display-time)

;; copy current buffer's file name to the clipboard
(global-set-key (kbd "C-M-x") 'copy-file-name-to-clipboard)
;; copy current buffer's file path to the clipboard
(global-set-key (kbd "C-M-c") 'copy-file-path-to-clipboard)
;; copy current buffer's file path to the clipboard
(global-set-key (kbd "C-M-g") 'copy-file-name-and-line-to-clipboard)

;; C-c をプリフィックスキー化
(define-key global-map "\C-c" (make-sparse-keymap))
;; quoted-insert は C-c C-c へ割り当て
(global-set-key "\C-c\C-c" 'quoted-insert)
;; window-resizer は C-c C-r (resize) で
(global-set-key "\C-c\C-r" 'window-resizer)
;; move between windows like vi
(global-set-key "\C-cl" 'windmove-right)
(global-set-key "\C-ch" 'windmove-left)
(global-set-key "\C-cj" 'windmove-down)
(global-set-key "\C-ck" 'windmove-up)

;; split window
(global-set-key (kbd "C-x h") 'split-window-horizontally-n)
(global-set-key (kbd "C-x v") 'split-window-vertically-n)

;; no startup msg
(setq inhibit-startup-message t)

;; specify major-mode by file type
(setq auto-mode-alist
      (append '(("\\.pc$" . c-mode)
                ("\\.edl$" . c-mode))
              auto-mode-alist))

;; disable scroll-mode
(scroll-bar-mode -1)

;; auto insert match parenthese
(defun my-local-electric-pair-mode ()
  (make-variable-buffer-local 'electric-pair-mode)
  (electric-pair-mode +1))
(add-hook 'c-mode-hook 'my-local-electric-pair-mode)

(global-display-line-numbers-mode)
(set-face-background 'line-number "gray16")
(set-face-foreground 'line-number "DimGray")
(set-face-foreground 'line-number-current-line "LightGray")

(global-set-key (kbd "C-c a") 'org-agenda)

;(global-set-key (kbd "C-M-i") 'delete-inside-operator)
(global-set-key (kbd "C-M-d") 'delete-forward-operator)
(global-set-key (kbd "C-M-h") 'delete-backward-operator)
(global-set-key (kbd "M-h") 'delete-backward)
(global-set-key (kbd "M-o")   'newline-next)
(global-set-key (kbd "C-M-o") 'newline-previous)
