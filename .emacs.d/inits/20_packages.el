(if window-system
    (use-package color-theme
      :config
      (progn
        (color-theme-initialize)
        (color-theme-dark-laptop))))

(use-package helm
  :bind
  (:map global-map
        ("C-x b" . helm-for-files)
        ("C-x C-f" . helm-find-files)
        ("M-x" . helm-M-x)
        ("M-y" . helm-show-kill-ring))
  (:map helm-map
        ("C-x C-a" . helm-select-action)
        ("C-i" . helm-execute-persistent-action))
  :config
  (helm-mode 1))

(use-package doom-modeline
  :config
  (doom-modeline-mode 1)
  (set-face-background 'mode-line "grey10")
  (set-face-foreground 'mode-line "PaleGreen")
  (set-face-foreground 'mode-line-buffer-id "PaleTurquoise")
  (set-face-foreground 'mode-line-emphasis "PaleGreen")
  (set-face-attribute 'mode-line nil :height 120)
  (set-face-attribute 'mode-line-inactive nil :height 120)

  ;; How tall the mode-line should be. It's only respected in GUI.
  ;; If the actual char height is larger, it respects the actual height.
  (setq doom-modeline-height 25)

  ;; How wide the mode-line bar should be. It's only respected in GUI.
                                        ;(setq doom-modeline-bar-width 3)
  (setq doom-modeline-bar-width 1)

  ;; Determines the style used by `doom-modeline-buffer-file-name'.
  ;;
  ;; Given ~/Projects/FOSS/emacs/lisp/comint.el
  ;;   truncate-upto-project => ~/P/F/emacs/lisp/comint.el
  ;;   truncate-from-project => ~/Projects/FOSS/emacs/l/comint.el
  ;;   truncate-with-project => emacs/l/comint.el
  ;;   truncate-except-project => ~/P/F/emacs/l/comint.el
  ;;   truncate-upto-root => ~/P/F/e/lisp/comint.el
  ;;   truncate-all => ~/P/F/e/l/comint.el
  ;;   relative-from-project => emacs/lisp/comint.el
  ;;   relative-to-project => lisp/comint.el
  ;;   file-name => comint.el
  ;;   buffer-name => comint.el<2> (uniquify buffer name)
  ;;
  ;; If you are expereicing the laggy issue, especially while editing remote files
  ;; with tramp, please try `file-name' style.
  ;; Please refer to https://github.com/bbatsov/projectile/issues/657.
  (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)

  ;; Whether display icons in mode-line or not.
  (setq doom-modeline-icon (display-graphic-p))

  ;; Whether display the icon for major mode. It respects `doom-modeline-icon'.
  (setq doom-modeline-major-mode-icon t)

  ;; Whether display color icons for `major-mode'. It respects
  ;; `doom-modeline-icon' and `all-the-icons-color-icons'.
  (setq doom-modeline-major-mode-color-icon t)

  ;; Whether display icons for buffer states. It respects `doom-modeline-icon'.
  (setq doom-modeline-buffer-state-icon t)

  ;; Whether display buffer modification icon. It respects `doom-modeline-icon'
  ;; and `doom-modeline-buffer-state-icon'.
  (setq doom-modeline-buffer-modification-icon t)

  ;; Whether display minor modes in mode-line or not.
  (setq doom-modeline-minor-modes (featurep 'minions))

  ;; If non-nil, a word count will be added to the selection-info modeline segment.
  (setq doom-modeline-enable-word-count nil)

  ;; Whether display buffer encoding.
  (setq doom-modeline-buffer-encoding t)

  ;; Whether display indentation information.
  (setq doom-modeline-indent-info nil)

  ;; If non-nil, only display one number for checker information if applicable.
  (setq doom-modeline-checker-simple-format t)

  ;; The maximum displayed length of the branch name of version control.
  (setq doom-modeline-vcs-max-length 12)

  ;; Whether display perspective name or not. Non-nil to display in mode-line.
  (setq doom-modeline-persp-name t)

  ;; Whether display icon for persp name. Nil to display a # sign. It respects `doom-modeline-icon'
  (setq doom-modeline-persp-name-icon nil)

  ;; Whether display `lsp' state or not. Non-nil to display in mode-line.
  (setq doom-modeline-lsp t)

  ;; Whether display GitHub notifications or not. Requires `ghub` package.
  (setq doom-modeline-github nil)

  ;; The interval of checking GitHub.
  (setq doom-modeline-github-interval (* 30 60))

  ;; Whether display mu4e notifications or not. Requires `mu4e-alert' package.
  (setq doom-modeline-mu4e t)

  ;; Whether display irc notifications or not. Requires `circe' package.
  (setq doom-modeline-irc t)

  ;; Function to stylize the irc buffer names.
  (setq doom-modeline-irc-stylize 'identity)

  ;; Whether display environment version or not
  (setq doom-modeline-env-version t)
  ;; Or for individual languages
  (setq doom-modeline-env-enable-python t)
  (setq doom-modeline-env-enable-ruby t)
  (setq doom-modeline-env-enable-perl t)
  (setq doom-modeline-env-enable-go t)
  (setq doom-modeline-env-enable-elixir t)
  (setq doom-modeline-env-enable-rust t)

  ;; Change the executables to use for the language version string
  (setq doom-modeline-env-python-executable "python") ; or `python-shell-interpreter'
  (setq doom-modeline-env-ruby-executable "ruby")
  (setq doom-modeline-env-perl-executable "perl")
  (setq doom-modeline-env-go-executable "go")
  (setq doom-modeline-env-elixir-executable "iex")
  (setq doom-modeline-env-rust-executable "rustc")

  ;; What to dispaly as the version while a new one is being loaded
  (setq doom-modeline-env-load-string "...")

  ;; Hooks that run before/after the modeline version string is updated
  (setq doom-modeline-before-update-env-hook nil)
  (setq doom-modeline-after-update-env-hook nil))

(use-package highlight-defined
  :config
  (add-hook 'emacs-lisp-mode-hook
            '(lambda ()
               (highlight-defined-mode t))))
               
(use-package company
  :bind
  (:map global-map
        ("C-M-i" . company-complete))
  (:map company-active-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous)
        ("C-h" . nil)
        ("C-S-h" . company-show-doc-buffer)
        ([tab] . company-complete-selection))
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (push 'company-gtags company-backends)
      (set-face-attribute 'company-tooltip nil
                  :foreground "#36c6b0" :background "#244f36")
      (set-face-attribute 'company-tooltip-common nil
                    :foreground "white" :background "#244f36")
      (set-face-attribute 'company-tooltip-selection nil
                  :foreground "#a1ffcd" :background "#007771")
      (set-face-attribute 'company-tooltip-common-selection nil
                    :foreground "white" :background "#007771")
      (set-face-attribute 'company-scrollbar-fg nil
                  :background "#4cd0c1")
      (set-face-attribute 'company-scrollbar-bg nil
                  :background "#002b37"))

(use-package highlight-indent-guides
  :init
  ;; (setq highlight-indent-guides-method 'column)
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-auto-odd-face-perc 15)
  (setq highlight-indent-guides-auto-even-face-perc 15)
  (setq highlight-indent-guides-auto-character-face-perc 20)
  ;; (setq highlight-indent-guides-character ?\x2507)
  (setq highlight-indent-guides-responsive 'top)
  :hook
  (emacs-lisp-mode . highlight-indent-guides-mode)
  (c-mode . highlight-indent-guides-mode)
  (c++-mode . highlight-indent-guides-mode))

(use-package ccls
  :init
  (setq ccls-executable "d:/bin/ccls/Release/ccls.exe")
  (setq ccls-sem-highlight-method 'font-lock)
  ;; (setq ccls-sem-highlight-method 'overlay)
  (setq lsp-ui-doc-enable nil)
  :config
  (face-spec-set 'ccls-sem-macro-face
                 '((t :foreground "PaleTurquoise"))
                 'face-defface-spec)
  (face-spec-set 'ccls-sem-global-variable-face
                 '((t :foreground "MediumPurple1"))
                 'face-defface-spec)
  (face-spec-set 'ccls-sem-member-face
                 '((t :foreground "RosyBrown1"))
                 'face-defface-spec)
  (face-spec-set 'ccls-sem-parameter-face
                 '((t :foreground "LightGoldenrod"
                      :italic t))
                 'face-defface-spec))

(use-package lsp-mode
  :config
  ;; (setq lsp-enable-semantic-highlighting t)
  ;; (setq lsp-eldoc-enable-hover nil)
  ;; (setq lsp-eldoc-render-all nil)
  ;; (setq lsp-eldoc-signature-render-all nil)
  ;; (setq lsp-file-watch-threshold nil)
  (setq lsp-ui-doc-enable nil)
  ;; (face-spec-set 'lsp-face-semhl-variable-local
  ;;                '((t :foreground "turquoise"))
  ;;                'face-defface-spec)
  :bind
  (:map c-mode-map
        ("M-?" . lsp-find-references))
  (:map c++-mode-map
        ("M-?" . lsp-find-references))
  :hook
  (c-mode   . lsp)
  (c++-mode . lsp))

(use-package yasnippet)
(use-package helm-xref)

(use-package org
  :init
  (defun show-org-buffer (file)
    "Show an org-file FILE on the current buffer."
    (interactive)
    (if (get-buffer file)
        (let ((buffer (get-buffer file)))
          (switch-to-buffer buffer)
          (message "%s" file))
      (find-file (concat "~/org/" file))))
  :bind
  (:map global-map
        ("C-c c" . org-capture)
        ("C-M-^" . (lambda () (interactive)
                     (show-org-buffer "notes.org"))))
  :config
  (setq org-directory "~/org")
  (setq org-default-notes-file "notes.org")
  (setq org-capture-templates
        '(
          ("n" "Note" entry (file+headline "~/org/notes.org" "Notes"))
          ("l" "linux" entry (file+headline "~/org/notes.org" "linux"))
          ("c" "c" entry (file+headline "~/org/notes.org" "c"))
          ("g" "gdb" entry (file+headline "~/org/notes.org" "gdb"))
          ("e" "emacs" entry (file+headline "~/org/notes.org" "emacs"))
          ("s" "svn" entry (file+headline "~/org/notes.org" "svn"))
          ))
  :hook (org-mode-hook . (lambda ()
                           (local-set-key [(return)]
                                          '(lambda () (interactive)
                                             (newline)
                                             (indent-relative-maybe))))))

(use-package woman
  :bind
  ;; enable vi-like key binding
  (:map woman-mode-map
        ("j" . next-line)
        ("k" . previous-line)
        ("J" . (lambda () (interactive) (scroll-up 1)))
        ("K" . (lambda () (interactive) (scroll-down 1)))
        ("b" . scroll-down)
        ("h" . backward-word)
        ("l" . forward-word))
  :config
  (setq woman-manpath '(
                      "~/cygwin64/usr/share/man/ja_JP.UTF-8"
                      ))
  ;; set width
  (add-hook 'woman-pre-format
            '(lambda ()
               (progn
                 (setq woman-fill-column (- (window-body-width) 10))
                 ))))

(use-package helm-gtags
  :config
  (add-hook 'helm-gtags-mode-hook
            '(lambda ()
               (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
               (local-set-key (kbd "M-T") 'helm-gtags-find-tag-other-window)
               (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
               (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
               (local-set-key (kbd "M-S") 'helm-gtags-show-stack)
               (local-set-key (kbd "M-R") 'helm-gtags-resume)
               (local-set-key (kbd "M-c") 'helm-gtags-clear-stack)
               (local-set-key (kbd "M-*") 'helm-gtags-pop-stack)))
  :hook
  (c-mode . helm-gtags-mode)
  (c++-mode . helm-gtags-mode))

(use-package evil
  :disabled
  :bind
  (:map key-translation-map
        ("C-c" . evil-escape-or-quit))
  (:map evil-operator-state-map
        ("C-c" . evil-escape-or-quit))
  (:map evil-normal-state-map
        ([escape] . keyboard-quit))
  :config
  (evil-mode 1))

(use-package default-text-scale
  :config
  (default-text-scale-mode 1))

(use-package auto-highlight-symbol
  :hook
  (c-mode . auto-highlight-symbol-mode)
  (c++-mode . auto-highlight-symbol-mode))

(use-package zjl-hl
  :config
  (add-hook 'after-init-hook 'zjl-hl-enable-global-all-modes))

(use-package smart-newline
  :ensure t
  :hook
  (prog-mode . smart-newline-mode))
