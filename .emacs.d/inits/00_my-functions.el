;; utility functions

;; copy a line.
(defun copy-whole-line (&optional arg)
  "Copy current line."
  (interactive "p")
  (or arg (setq arg 1))
  (if (and (> arg 0) (eobp) (save-excursion (forward-visible-line 0) (eobp)))
      (signal 'end-of-buffer nil))
  (if (and (< arg 0) (bobp) (save-excursion (end-of-visible-line) (bobp)))
      (signal 'beginning-of-buffer nil))
  (unless (eq last-command 'copy-region-as-kill)
    (kill-new "")
    (setq last-command 'copy-region-as-kill))
  (cond ((zerop arg)
         (save-excursion
           (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
           (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))))
        ((< arg 0)
         (save-excursion
           (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))
           (copy-region-as-kill (point)
                                (progn (forward-visible-line (1+ arg))
                                       (unless (bobp) (backward-char))
                                       (point)))))
        (t
         (save-excursion
           (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
           (copy-region-as-kill (point)
                                (progn (forward-visible-line arg) (point))))))
  (message (substring (car kill-ring-yank-pointer) 0 -1)))

;; copy current buffer's file path to the clipboard.
(defun copy-file-path-to-clipboard ()
  "Copy the current buffer file path to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file path '%s' to the clipboard." filename))))

;; copy current buffer's file name to the clipboard.
(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((bfp (buffer-file-name)))
    (when (stringp bfp)
      (let ((bfn (substring bfp (+ (string-match "/[^/]+$" bfp) 1))))
        (kill-new bfn)
        (message "Copied buffer file name '%s' to the clipboard." bfn)))))

;; copy current buffer's file name and line to the clipboard.
(defun copy-file-name-and-line-to-clipboard ()
  "Copy the current buffer file name and line to the clipboard."
  (interactive)
  (let ((bfp (buffer-file-name)))
    (when (stringp bfp)
      (let* ((bfn (substring bfp (+ (string-match "/[^/]+$" bfp) 1)))
             (bfnl (format "%s:%s" bfn (line-number-at-pos))))
        (kill-new bfnl)
        (message "Copied buffer file name '%s' to the clipboard." bfnl)))))

;; window resize function
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))

;; split window vertically
(defun split-window-vertically-n (num_wins)
  (interactive "nCount:")
  (if (= num_wins 2)
      (split-window-vertically)
    (progn
      (split-window-vertically
       (- (window-height) (/ (window-height) num_wins)))
      (split-window-vertically-n (- num_wins 1)))))

;; split window horizontally
(defun split-window-horizontally-n (num_wins)
  (interactive "nCount:")
  (if (= num_wins 2)
      (split-window-horizontally)
    (progn
      (split-window-horizontally
       (- (window-width) (/ (window-width) num_wins)))
      (split-window-horizontally-n (- num_wins 1)))))

(defun delete-backward ()
  (interactive)
  (backward-word)
  (kill-word 1))

;; Find the point where matching operator locates.
;; bcode is ?\(, ?\[ or ?\{.
(defun find-match-pair (bcode)
  (let (str (cnt 1) ecode)
    (cond ((equal bcode ?\()
           (setq str "^()")
           (setq ecode ?\)))
          ((equal bcode ?\[)
           (setq str "^[]")
           (setq ecode ?\]))
          ((equal bcode ?\{)
           (setq str "^{}")
           (setq ecode ?\})))
    (catch 'found
      (while t 
        (skip-chars-forward str)
        (cond ((equal bcode (char-after (point)))
               (setq cnt (1+ cnt)))
              ((equal ecode (char-after (point)))
               (setq cnt (1- cnt))))
        (if (equal cnt 0)
            (throw 'found t)
          (forward-char))))
    (point)))

;; Delete the region which is enclosed by operators such as (), [], {}.
(defun delete-inside-operator ()
  (interactive)
  (let (tgt begin end)
    (skip-chars-backward "^([{")
    (setq begin (point))
    (setq bcode (char-before (point)))
    (setq end (find-match-pair bcode))
    (delete-region begin end)))

;; Delete forward until the operators such as ), ], }.
(defun delete-forward-operator ()
  (interactive)
  (let ((begin (point)) end)
    (skip-chars-forward "^()[]{} ")
    (setq end (point))
    (delete-region begin end)))

;; Delete backward until the operators such as (, [, {.
(defun delete-backward-operator ()
  (interactive)
  (let ((end (point)) begin)
    (skip-chars-backward "^()[]{} ")
    (setq begin (point))
    (delete-region begin end)))

;; Add newline like o in vim.
(defun newline-next ()
  (interactive)
  (end-of-line)
  (newline-and-indent))

;; Add newline like O in vim.
(defun newline-previous ()
  (interactive)
  (previous-line)
  (newline-next))

;; highlight current line.
(defface my-hl-line-face
  '((((class color) (background dark))
     (:background "grey8" t))
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)

;; auto insert match parenthese
(defun my-local-electric-pair-mode ()
  (make-variable-buffer-local 'electric-pair-mode)
  (electric-pair-mode +1))
