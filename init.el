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

(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-evil-leader-mode t)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "e" (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

(evil-mode t)

(require 'surround)
(global-surround-mode t)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(require 'ein)

(add-hook 'org-agenda-mode-hook
  (lambda () 
    (define-key org-agenda-mode-map "j" 'evil-next-line)
    (define-key org-agenda-mode-map "k" 'evil-previous-line)))

(if (eq system-type 'darwin)
  (setq org-agenda-files '("/Users/phil/Dropbox/doc/gtd.org")))

(if (eq system-type 'windows-nt)
  (setq org-agenda-files '("c:/Users/rsl/Dropbox/doc/gtd.org")))
