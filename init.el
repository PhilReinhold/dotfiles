(require 'package)
(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(evil-mode)

(global-set-key "\C-ca" 'org-agenda)