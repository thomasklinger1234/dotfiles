;; https://protesilaos.com/codelog/2024-11-28-basic-emacs-configuration/#h:eafd6e24-e4eb-4963-92a5-c61b0c877b7f

(setq custom-file (locate-user-emacs-file "init.custom.el"))
(load custom-file :no-error-if-file-is-missing)

(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(when (< emacs-major-version 29)
  (unless (package-installed-p 'use-package)
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install 'use-package)))

(setq tool-bar-mode 0)
(menu-bar-mode -1)
(global-display-line-numbers-mode)

(setq indent-tabs-mode nil)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq org-agenda-files (quote ("~/Documents/Org")))
