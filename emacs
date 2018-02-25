;; initialize
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

;; package manager
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;; code autocompletion
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; company mode
(add-hook 'c++-mode-hook 'company-mode) (add-hook 'c-mode-hook 'company-mode)
(defun my-irony-mode-hook () (define-key irony-mode-map [remap completion-at-point] 'irony-completion-at-point-async) (define-key irony-mode-map [remap complete-symbol] 'irony-completion-at-point-async)) (add-hook 'irony-mode-hook 'my-irony-mode-hook) (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options) (eval-after-load 'company '(add-to-list 'company-backends 'company-irony))

;; set up irony extensions
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(add-hook 'c++-mode-hook 'flycheck-mode) (add-hook 'c-mode-hook 'flycheck-mode) (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
(add-hook 'irony-mode-hook 'irony-eldoc)

;; bind TAB for indent-or-complete
(defun irony--check-expansion ()
(save-excursion
  (if (looking-at "\\_>") t
    (backward-char 1)
    (if (looking-at "\\.") t
      (backward-char 1)
      (if (looking-at "->") t nil)))))
(defun irony--indent-or-complete ()
"Indent or Complete"
(interactive)
(cond ((and (not (use-region-p))
            (irony--check-expansion))
       (message "complete")
       (company-complete-common))
      (t
       (message "indent")
       (call-interactively 'c-indent-line-or-region))))
(defun irony-mode-keys ()
"Modify keymaps used by `irony-mode'."
(local-set-key (kbd "TAB") 'irony--indent-or-complete)
(local-set-key [tab] 'irony--indent-or-complete))
(add-hook 'c-mode-common-hook 'irony-mode-keys)

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 (quote
		(go-autocomplete auto-complete go-mode elpy flycheck-irony irony-eldoc company-irony irony))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; python ide
(package-initialize)
(elpy-enable)

;; julia ide
(add-to-list 'load-path "~/.emacs.d/julia-emacs/")
(require 'julia-mode)

;; Scrolling in tmux
(require 'xt-mouse)
(xterm-mouse-mode)
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))

(setq mouse-wheel-follow-mouse 't)

(defvar alternating-scroll-down-next t)
(defvar alternating-scroll-up-next t)

(defun alternating-scroll-down-line ()
  (interactive "@")
  (when alternating-scroll-down-next
					;      (run-hook-with-args 'window-scroll-functions )
    (scroll-down-line))
  (setq alternating-scroll-down-next (not alternating-scroll-down-next)))

(defun alternating-scroll-up-line ()
  (interactive "@")
  (when alternating-scroll-up-next
					;      (run-hook-with-args 'window-scroll-functions)
    (scroll-up-line))
  (setq alternating-scroll-up-next (not alternating-scroll-up-next)))

(global-set-key (kbd "<mouse-4>") 'alternating-scroll-down-line)
(global-set-key (kbd "<mouse-5>") 'alternating-scroll-up-line)

;; smaller tab sizes
(setq default-tab-width 2)

;; show column number
(setq column-number-mode t)

;; go autocompelete
(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)
(with-eval-after-load 'go-mode
   (require 'go-autocomplete))
(defun my-go-mode-hook ()
    ;; Godef jump key binding
    (local-set-key (kbd "C-c j") 'godef-jump-other-window)
    (local-set-key (kbd "C-c .") 'pop-tag-mark)
		;; auto format
		(add-hook 'before-save-hook 'gofmt-before-save)
    )
(add-hook 'go-mode-hook 'my-go-mode-hook)


(defun my-prog-mode-hook ()
		;; whitespace cleanup
		(add-hook 'before-save-hook 'whitespace-cleanup)
    )
(add-hook 'prog-mode-hook 'my-prog-mode-hook)
