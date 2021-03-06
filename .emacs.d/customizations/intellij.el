(defun intellij-kill-current-buffer ()
  (interactive)
  (kill-buffer (buffer-name)))

(defun intellij-send-top-form-to-repl ()
  (interactive)
  (cider-insert-last-sexp-in-repl -1)
  (cider-switch-to-last-clojure-buffer))

(defun intellij-reformat-code ()
  (interactive)
  (mark-whole-buffer)
  (indent-region (region-beginning) (region-end))
  (pop-global-mark))

(defun indent-marked-files ()
  (interactive)
  (dolist (file (dired-get-marked-files))
    (find-file file)
    (indent-region (point-min) (point-max))
    (save-buffer)
    (kill-buffer nil)))

(defun cider-dev>reset ()
  "dev>(reset). convenient function to reset my clojure development system"
  (interactive)
  (cider-switch-to-repl-buffer)
  (insert "(dev/reset)")
  (cider-repl-return)
  ;;(cider-switch-to-last-clojure-buffer)
  )

(defun cider-dev>c.t.n.repl/refresh ()
  "dev>(reset). convenient function to reset my clojure development system"
  (interactive)
  (cider-switch-to-repl-buffer)
  (insert "(clojure.tools.namespace.repl/refresh)")
  (cider-repl-return)
  ;;(cider-switch-to-last-clojure-buffer)
  )

(defun cider-dev>eval-last-repl-input ()
  (interactive)
  )

(defun better-transpose-sexps-up (arg)
  "mimic move form up cursive"
  (interactive "*p")
  (transpose-sexps arg)
  (paredit-backward)
  (paredit-backward)
  ;;(previous-line)
  )

(defun better-transpose-sexps-down (arg)
  "mimic move form up cursive"
  (interactive "*p")
  (paredit-forward)
  (transpose-sexps arg)
  (paredit-backward)
  ;;(previous-line)
  )

(defun experiment-repair-all-unused-space ()
  "experiment stuff"
  (interactive)
  (beginning-of-buffer)
  (while (re-search-forward "[ ]+" nil t)
    (replace-match " "))
  (intellij-reformat-code))

"foobar" "as"


(global-undo-tree-mode 1)
(global-set-key (kbd "<C-up>") 'better-transpose-sexps-up)
(global-set-key (kbd "<C-down>") 'better-transpose-sexps-down)
(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key (kbd "C-S-z") 'undo-tree-redo)

(global-set-key (kbd "C-1") 'smex)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-o") 'ido-find-file)
(global-set-key (kbd "C-b") 'ido-switch-buffer)
(global-set-key (kbd "M-x") 'kill-region)
(global-set-key (kbd "M-c") 'copy-region-as-kill)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "C-S-l") 'cider-load-buffer)
(global-set-key (kbd "C-S-n") 'cider-repl-set-ns)
(global-set-key (kbd "C-S-p") 'intellij-send-top-form-to-repl)
(global-set-key (kbd "<M-up>") 'er/expand-region)
(global-set-key (kbd "C-M-l") 'intellij-reformat-code)
(global-set-key (kbd "C-w") 'intellij-kill-current-buffer)
(global-set-key (kbd "M-{") 'tabbar-backward-group)
(global-set-key (kbd "M-}") 'tabbar-forward-group)
(global-set-key (kbd "M-1") 'other-window)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-F") 'isearch-forward-regexp)
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "C-M-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "<f5>") 'cider-dev>reset)
(global-set-key (kbd "<f6>") 'cider-dev>c.t.n.repl/refresh)
(global-set-key (kbd "<C-tab>") 'other-window)
