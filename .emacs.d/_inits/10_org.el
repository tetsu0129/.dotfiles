;; org-mode settings

; file location
(setq org-directory "~/org")
; file name
(setq org-default-notes-file "notes.org")
; Org-captureを呼び出すキーシーケンス
(define-key global-map "\C-cc" 'org-capture)
; Org-captureのテンプレート（メニュー）の設定
(setq org-capture-templates
      '(
        ("n" "Note" entry (file+headline "~/org/notes.org" "Notes"))
        ("l" "linux" entry (file+headline "~/org/tips.org" "linux"))
        ("c" "c" entry (file+headline "~/org/tips.org" "c"))
        ("g" "gdb" entry (file+headline "~/org/tips.org" "gdb"))
        ("e" "emacs" entry (file+headline "~/org/tips.org" "emacs"))
        ("s" "svn" entry (file+headline "~/org/tips.org" "svn"))
        ))
; メモをC-M-^一発で見るための設定
; https://qiita.com/takaxp/items/0b717ad1d0488b74429d から拝借
(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
        (switch-to-buffer buffer)
        (message "%s" file))
    (find-file (concat "~/org/" file))))
(global-set-key (kbd "C-M-^") '(lambda () (interactive)
                                 (show-org-buffer "notes.org")))

; return with indent like txt-mode
(add-hook
 'org-mode-hook
 '(lambda ()
    (local-set-key [(return)]
     '(lambda () (interactive)
        (newline)
        (indent-relative-maybe)))))
