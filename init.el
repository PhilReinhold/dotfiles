(require 'package)
(add-to-list 'package-archives 
    '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-evil-leader-mode t)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "e" (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

(evil-mode t)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)



;(define-key org-agenda-mode-map "j" 'evil-next-line)
;(define-key org-agenda-mode-map "k" 'evil-previous-line)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("c:/Users/rsl/Dropbox/doc/gtd.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
