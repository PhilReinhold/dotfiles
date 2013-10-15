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
 '(evil evil-leader surround ein auctex auto-complete))

(tool-bar-mode nil)
(ido-mode)

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
  "o" 'open-org-file)

(evil-mode t)

(require 'surround)
(global-surround-mode t)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

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

" Fix Ctrl-[ as Escape
(define-key evil-normal-state-map (kbd "ESC") 'evil-force-normal-state)
(define-key evil-visual-state-map (kbd "ESC") 'evil-exit-visual-state)
(define-key evil-insert-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-replace-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-ex-completion-map (kbd "ESC") 'abort-recursive-edit)
