;; initialization preferences
(package-initialize)
(setq make-backup-files nil)
(setq inhibit-startup-screen t)
(setq column-number-mode t)
(global-set-key (kbd "C-u") 'undo)

;; navigate paragraphs
(global-set-key (kbd "ESC <up>") 'backward-paragraph)
(global-set-key (kbd "ESC <down>") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;; select region color
(transient-mark-mode 1)
(set-face-attribute 'region nil :background "#ff99cc")

;; switch between windows
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c o") 'other-window)
(global-set-key [(control x) (k)] 'kill-this-buffer)

