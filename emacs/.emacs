;; https://protesilaos.com/codelog/2024-11-28-basic-emacs-configuration/#h:eafd6e24-e4eb-4963-92a5-c61b0c877b7f

(setq custom-file (locate-user-emacs-file "init.custom.el"))
(load custom-file :no-error-if-file-is-missing)

(setq delete-auto-save-files t)
(setq auto-save-list-file-prefix "~/.emacs.d/autosave/")
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/autosave/" t)))

(setq create-lockfiles nil)

(require 'package)
(package-initialize)

(add-to-list 'package-archives
 '("melpa" . "https://melpa.org/packages/"))

(when (< emacs-major-version 29)
  (unless (package-installed-p 'use-package)
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install 'use-package)))

(setq tool-bar-mode 0)
(menu-bar-mode -1)
(show-paren-mode 1)
(electric-pair-mode 1)
(global-display-line-numbers-mode)

(windmove-default-keybindings)

(setq indent-tabs-mode nil)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(setq backup-directory-alist `(("." . "~/.emacs/backup")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; ORG MODE
;; https://orgmode.org/
(setq org-directory "~/Documents/org")
(setq org-agenda-files (quote ("~/Documents/org")))
(setq org-log-done 'time)
(setq org-return-follows-link t)
(setq org-hide-emphasis-markers t)
(setq org-default-notes-file (concat org-directory "/notes.org"))

(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'visual-line-mode)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; GIT INTEGRATION
;; https://docs.magit.vc/magit/
(use-package magit
  :defer t)

;; GIT GPG INTEGRATION
;; https://github.com/ecraven/pinentry-emacs
;; https://emacs.stackexchange.com/questions/64578/emacs-pinentry-not-working-on-emacs-28-0-50-and-ubuntu-20-04
(use-package pinentry
  :config
  (setq epa-pinentry-mode 'loopback)
  (pinentry-start))

(defun pinentry-emacs (desc prompt ok error)
  (let ((str (read-passwd (concat (replace-regexp-in-string "%22" "\"" (replace-regexp-in-string "%0A" "\n" desc)) prompt ": "))))
    str))

;; VERTICO
(use-package vertico
  :ensure
  :init
  (vertico-mode))

;; ORDERLESS
(use-package orderless
  :ensure)

(setq completion-styles '(orderless basic))

;; GO INTEGRATION
(use-package lsp-mode
  :defer)

(use-package go-mode
  :defer)

(defun my/go-lsp-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'my/go-lsp-install-save-hooks)
(add-hook 'go-mode-hook 'eglot-ensure)

(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
