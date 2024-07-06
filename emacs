;; initialization preferences
(package-initialize)
(setq make-backup-files nil)
(setq inhibit-startup-screen t)
(setq column-number-mode t)
(global-set-key (kbd "C-u") 'undo)

;; naviage paragraphs
(global-set-key (kbd "ESC <up>") 'backward-paragraph)
(global-set-key (kbd "ESC <down>") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'backward-paragraph)

;;truncate lines
(set-default 'truncate-lines t)

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

;; avoid using C-f, C-g, and C-d to free them up for other uses
(define-key key-translation-map [?\C-t] [?\C-f])
(define-key key-translation-map [?\C-l] [?\C-g])
(global-set-key (kbd "C-p") 'find-file)
(global-set-key (kbd "C-o") 'find-file)

;; comment lines
(global-set-key (kbd "C-;") 'comment-line)

;; autoreload changed files
(setq revert-without-query '(".*"))


