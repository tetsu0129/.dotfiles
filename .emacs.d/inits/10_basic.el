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
(global-set-key "\C-xL" 'load-file)

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
     (:background "NavyBlue" t))
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
;(global-hl-line-mode t)

;; move to the other window by M-o.
(global-set-key "\M-o" 'other-window)

;; display time.
(setq display-time-24hr-format t)
(display-time)
