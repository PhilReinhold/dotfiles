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
 '(evil evil-leader surround ein auctex))

(tool-bar-mode nil)

(setq is-windows (eq system-type 'windows-nt))

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
    (find-file "~/Dropbox/doc/gtd.org"))
  (auto-revert-mode))

(global-evil-leader-mode t)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "e" 'open-init-file
  "o" 'open-org-file
  "g" 'magit-status)

(evil-mode t)

(require 'surround)
(global-surround-mode t)

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

(require 'ein)
(require 'tex)

(if is-windows
  (setq org-agenda-files '("c:/Users/rsl/Dropbox/doc/gtd.org"))
  (setq org-agenda-files '("/Users/phil/Dropbox/doc/gtd.org")))

(if is-windows
  (setq preview-gs-command "c:/Program Files/gs/gs8.54/bin/gswin32c.exe"))

(setq preview-scale-function 1.5)
