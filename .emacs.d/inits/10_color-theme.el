;; テーマ
;; X環境のみ
(if window-system
    (progn
      (require 'color-theme)
      (color-theme-initialize)
      (color-theme-dark-laptop)))
