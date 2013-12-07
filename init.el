;; Packages
(require 'package)
(add-to-list 'package-archives 
    '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(package-refresh-contents)

(mapc
 (lambda (package)
   (or (package-installed-p package)
       (if (y-or-n-p (format "Package %s is missing. Install it? " package)) 
           (package-install package))))
 '(evil evil-leader surround ein auctex auto-complete magit))

;; Interface
(tool-bar-mode -1)
(ido-mode)
(setq visible-bell 1)

(setq is-windows (eq system-type 'windows-nt))

;; File Shortcuts
(defun open-init-file ()
  (interactive)
  (if is-windows
    (if (file-exists-p "C:/Users/Phil/dotfiles/init.el")
	(find-file "C:/Users/Phil/dotfiles/init.el")
	(find-file "C:/Phil/code/dotfiles/init.el"))
    (find-file "~/.emacs.d/init.el"))
  (auto-revert-mode))

(defun open-org-file ()
  (interactive)
  (if is-windows
      (if (file-exists-p "C:/Users/Phil/Dropbox/doc/gtd.org")
	(find-file "C:/Users/Phil/Dropbox/doc/gtd.org")
	(find-file "C:/Users/rsl/Dropbox/doc/gtd.org"))
    (find-file "~/notes/gtd.org"))
  (auto-revert-mode))

;; Vim Evmulation
(global-evil-leader-mode t)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "e" 'open-init-file
  "o" 'open-org-file
  "g" 'magit-status
  "EB" 'eval-buffer)

(evil-mode t)
(require 'surround)
(global-surround-mode t)

; Fix Ctrl-[ as Escape
(define-key evil-normal-state-map (kbd "ESC") 'evil-force-normal-state)
(define-key evil-visual-state-map (kbd "ESC") 'evil-exit-visual-state)
(define-key evil-insert-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-replace-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-ex-completion-map (kbd "ESC") 'abort-recursive-edit)

; Fix return indentation
(define-key evil-insert-state-map (kbd "RET") 'newline-and-indent)

;; Org Mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(add-hook 'org-agenda-mode-hook
  (lambda () 
    (define-key org-agenda-mode-map "j" 'evil-next-line)
    (define-key org-agenda-mode-map "k" 'evil-previous-line)))

(if is-windows
  (setq org-agenda-files '("c:/Users/rsl/Dropbox/doc/gtd.org"))
  (setq org-agenda-files '("/Users/phil/notes/gtd.org")))

(require 'ein)

;; AucTeX
(require 'tex)

(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin"))
(setq exec-path (append exec-path '("/usr/texbin")))
(setq TeX-PDF-mode t)
(add-to-list 'TeX-view-program-list '("open" "open %o"))
(add-to-list 'TeX-view-program-selection '(output-pdf "open"))

(if is-windows
  (setq preview-gs-command "c:/Program Files/gs/gs8.54/bin/gswin32c.exe"))

(setq preview-scale-function 1.5)
