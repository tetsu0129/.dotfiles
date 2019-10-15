 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; These are windows only settings.

(set-language-environment "Japanese")
;; LANG is need for japanese search with lgrep.
(setenv "LANG" "ja_JP.sjis")

;; character-code setting.
;; add cp932 to the coding system for visiting file buffer.
(prefer-coding-system 'japanese-cp932-dos)
;; The coding system for new file buffer.
;(set-default 'buffer-file-coding-system 'japanese-cp932-dos)
(set-default 'buffer-file-coding-system 'utf-8-unix)

;; use utf-8-unix for c source, c header, elisp files.
;; (modify-coding-system-alist 'file "\\.c\\'" 'utf-8-unix)  ;; c source
;; (modify-coding-system-alist 'file "\\.h\\'" 'utf-8-unix)  ;; c header
;; (modify-coding-system-alist 'file "\\.c\\'" 'utf-8)  ;; c source
;; (modify-coding-system-alist 'file "\\.h\\'" 'utf-8)  ;; c header
;; (modify-coding-system-alist 'file "\\.el\\'" 'utf-8-unix)  ;; elisp
(modify-coding-system-alist 'file "\\.txt\\'" 'japanese-cp932-dos) ;; txt
(modify-coding-system-alist 'file "\\.org\\'" 'japanese-cp932-dos) ;; txt

;; resolve windows shortcuts
;; w32-symlinks.el
(custom-set-variables '(w32-symlinks-handle-shortcuts t))
(require 'w32-symlinks)

(defadvice insert-file-contents-literally (before insert-file-contents-literally-before activate)
  (set-buffer-multibyte nil))

(defadvice minibuffer-complete (before expand-symlinks activate)
  (let ((file (expand-file-name
               (buffer-substring-no-properties
                (line-beginning-position) (line-end-position)))))
    (when (file-symlink-p file)
      (delete-region (line-beginning-position) (line-end-position))
      (insert (w32-symlinks-parse-symlink file)))))
(setq vc-follow-symlinks t)

;; server start for emacs-client
(when window-system                       ; GUI時
  (require 'server)
  (unless (eq (server-running-p) 't)
    (server-start)

    (defun iconify-emacs-when-server-is-done ()
      (unless server-clients (iconify-frame)))

    ;; C-x C-cに割り当てる(好みに応じて)
    (global-set-key (kbd "C-x C-c") 'server-edit)
    ;; M-x exitでEmacsを終了できるようにする
    (defalias 'exit 'save-buffers-kill-emacs)
    ;; 起動時に最小化する
    ;(add-hook 'after-init-hook 'iconify-emacs-when-server-is-done)

    ;; 終了時にyes/noの問い合わせ
    ;(setq confirm-kill-emacs 'yes-or-no-p)
    )
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

