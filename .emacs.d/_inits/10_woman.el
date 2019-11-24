;; --- woman_cfg.el ---

;(setq woman-use-own-frame nil)

;; set directory paths which have manual.
(setq woman-manpath '(
                      "~/cygwin64/usr/share/man/ja_JP.UTF-8"
                      ))

;; set width
(add-hook 'woman-pre-format-hook
          '(lambda ()
             (progn
               (setq woman-fill-column (- (window-body-width) 10))
               )))

;; enable vi-like key binding
(add-hook 'woman-post-format-hook
	  '(lambda ()
             (progn
               (define-key woman-mode-map "j" 'next-line)
               (define-key woman-mode-map "k" 'previous-line)
               (define-key woman-mode-map "J"
                 '(lambda () (interactive) (scroll-up 1)))
               (define-key woman-mode-map "K"
                 '(lambda () (interactive) (scroll-down 1)))
               (define-key woman-mode-map "b" 'scroll-down)
               (define-key woman-mode-map "h" 'backward-word)
               (define-key woman-mode-map "l" 'forward-word)
               )))
