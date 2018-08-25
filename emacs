;; initialize

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq make-backup-files nil)
(setq inhibit-startup-screen t)

;; key bindings
(global-set-key (kbd "ESC <up>") 'backward-paragraph)
(global-set-key (kbd "ESC <down>") 'forward-paragraph)
(global-set-key (kbd "C-u") 'undo)
(global-set-key [(control x) (k)] 'kill-this-buffer)

;; select region color
(transient-mark-mode 1)
(set-face-attribute 'region nil :background "#ff99cc")

;; c++ mode for .h files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; julia ide
(add-to-list 'load-path "~/.emacs.d/julia-emacs/")
(require 'julia-mode)

;; tab formatting
(setq default-tab-width 2)
(setq-default indent-tabs-mode nil)

;; show column number
(setq column-number-mode t)

(defun my-prog-mode-hook ()
    ;; whitespace cleanup
    (add-hook 'before-save-hook 'whitespace-cleanup)
    )
(add-hook 'prog-mode-hook 'my-prog-mode-hook)
