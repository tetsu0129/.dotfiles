;; --- company_cfg.el ---

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

;; activate context-based completion.
(semantic-mode 1)

