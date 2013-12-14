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
 '(evil
   evil-leader
   surround
   ein
   auctex
   auto-complete
   magit
   yasnippet
   color-theme
   auto-complete
   smooth-scroll
   ))

;; Interface
(tool-bar-mode -1)
(scroll-bar-mode -1)
(ido-mode)
(setq visible-bell 1)
(color-theme-initialize)
(load-theme 'molokai t)

; Scrolling
(setq
 scroll-conservatively 10
 mouse-wheel-scroll-amount '(0.001))
(require 'smooth-scroll)
(smooth-scroll-mode t)

(yas-global-mode 1)
(require 'auto-complete-config)
(global-auto-complete-mode t)

(setq is-windows (eq system-type 'windows-nt))

(if (not is-windows)
    (add-to-list 'exec-path "/usr/local/bin")
    (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin")))

(if is-windows
    (if (file-exists-p "C:/Users/Phil/dotfiles/init.el")
	(setq my-init-file-path "C:/Users/Phil/dotfiles/init.el")
      (setq my-init-file-path "C:/Phil/code/dotfiles/init.el"))
  (setq my-init-file-path "~/.emacs.d/init.el"))

;; File Shortcuts
(defun open-init-file ()
  (interactive)
  (let ((vc-follow-symlinks t))
    (find-file my-init-file-path)
    (auto-revert-mode)))

(defun open-org-file ()
  (interactive)
  (if is-windows
      (if (file-exists-p "C:/Users/Phil/Dropbox/doc/gtd.org")
	(find-file "C:/Users/Phil/Dropbox/doc/gtd.org")
	(find-file "C:/Users/rsl/Dropbox/doc/gtd.org"))
    (find-file "~/notes/gtd.org"))
  (auto-revert-mode))

(defun open-home-dir ()
  (interactive)
  (if is-windows
      (find-file "C:/Users/Phil")
      (find-file "~")))
    

;; Vim Evmulation
(global-evil-leader-mode t)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "e" 'open-init-file
  "o" 'open-org-file
  "h" 'open-home-dir
  "g" 'magit-status
  "Eb" 'eval-buffer
  "Er" 'eval-region)

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

; preserve more movement keys in dired-mode
(evil-define-key 'normal dired-mode-map
  "gg" 'evil-goto-first-line
  "w" 'evil-forward-word-begin
  "e" 'evil-forward-word-end
  "G" 'evil-goto-line
  "H" 'evil-window-top
  "M" 'evil-window-middle
  "L" 'evil-window-bottom
  ",g" 'revert-buffer ; Put old bindings onto comma
  ",w" 'dired-copy-filename-as-kill
  ",G" 'dired-do-chgrp
  ",G" 'dired-do-chgrp
  ",H" 'dired-do-hardlink
  ",M" 'dired-do-chmod
  ",L" 'dired-do-load)

; '*' & '#' search for symbols not words
(setq evil-symbol-word-search t)

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
(setq preview-scale-function 1.5)


;; Doc View Mode
(add-hook
 'doc-view-mode-hook
 (lambda ()
   (setq doc-view-continuous t)
; Downscaling in ghostscript seems to increase image quality on retina
   (add-to-list doc-view-ghostscript-options "-dDownScaleFactor=5")))

(if is-windows
  (setq preview-gs-command "c:/Program Files/gs/gs8.54/bin/gswin32c.exe"))

;; Python
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args "--profile=dev"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(setq dired-use-ls-dired nil)
(setq initial-buffer-choice "~/")

(if (not is-windows)
    (setq doc-view-resolution 200))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:foreground "pale turquoise" :weight bold :height 1.5))))
 '(outline-1 ((t (:inherit font-lock-function-name-face :foreground "#66D9EF" :height 1.3))))
 '(outline-2 ((t (:inherit font-lock-variable-name-face :foreground "#F92672" :height 1.2))))
 '(outline-3 ((t (:inherit font-lock-keyword-face :foreground "#A6E22E" :height 1.1)))))
