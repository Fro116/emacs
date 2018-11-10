;; initialization preferences
(package-initialize)
(setq make-backup-files nil)
(setq inhibit-startup-screen t)
(setq column-number-mode t)
(global-set-key (kbd "C-u") 'undo)

;; interactive browsing
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")
(global-set-key (kbd "C-x C-d") 'dired)

;; switch between windows
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-c o") 'ace-window)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key [(control x) (k)] 'kill-this-buffer)

;; navigate paragraphs
(global-set-key (kbd "ESC <up>") 'backward-paragraph)
(global-set-key (kbd "ESC <down>") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;; enable mouse mode
(xterm-mouse-mode 1)
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda () (interactive) (scroll-down 1)))
  (global-set-key [mouse-5] (lambda () (interactive) (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

;; select region color
(transient-mark-mode 1)
(set-face-attribute 'region nil :background "#ff99cc")

;; tab formatting
(setq-default indent-tabs-mode nil)
(setq c-default-style "linux" c-basic-offset 4)

;; whitespace cleanup
(defun my-prog-mode-hook () (add-hook 'before-save-hook 'whitespace-cleanup))
(add-hook 'prog-mode-hook 'my-prog-mode-hook)
