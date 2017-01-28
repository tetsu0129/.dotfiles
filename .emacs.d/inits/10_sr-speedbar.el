;; --- sr_speedbar_cfg.el ---
(require 'sr-speedbar)

(add-hook 'speedbar-before-popup-hook (lambda () (global-linum-mode f)))

;; toggle speedbar by M-l.
(global-set-key "\M-l" 'sr-speedbar-toggle)

