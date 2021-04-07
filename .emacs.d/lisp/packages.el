;; package repositories
(setq package-archives '(("gnu"          . "https://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://melpa.org/packages/")))

;; install use-package

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; package configuration

;; theme

(use-package dracula-theme
  :ensure t
  :config (load-theme 'dracula t))

;; file modes

(use-package crontab-mode
  :ensure t)

(use-package nginx-mode
  :ensure t)

(use-package rust-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package markdown-mode
  :ensure t
  :config (setq markdown-max-image-size '(600 . 600)))

(use-package dockerfile-mode
  :ensure t
  :mode ("\\.env" . conf-mode))

(use-package go-mode
  :ensure t
  :config (add-hook 'before-save-hook #'gofmt-before-save))

(use-package scala-mode
  :ensure t
  :mode "\\.s\\(cala\\|bt\\)$")

(use-package groovy-mode
  :ensure t
  :mode (("Jenkinsfile" . groovy-mode))
  :config (setq groovy-indent-offset 2))

(use-package js2-mode
  :ensure t
  :mode (("\\.js" . js2-mode))
  :config (setq js-indent-level 2))

(use-package terraform-mode
  :ensure t
  :config (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode))

;; editing experience

(use-package better-defaults
  :ensure t)

(use-package paredit
  :ensure t
  :config (progn
            (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
            (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
            (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
            (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
            (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
            (add-hook 'scheme-mode-hook           #'enable-paredit-mode)))

(use-package highlight-parentheses
  :ensure t)

(use-package whitespace-mode
  :bind (("C-x w" . whitespace-mode)))

(use-package multiple-cursors
  :ensure t
  :bind (("C-c m *" . mc/edit-lines)
         ("C-c m >" . mc/mark-next-like-this)
         ("C-c m <" . mc/mark-previous-like-this)
         ("C-c m ." . mc/mark-all-like-this)
         ("C-c m i" . mc/mark-more-like-this-extended)))

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; tools

(use-package erc
  :ensure t)

(use-package flycheck
  :ensure t)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package org
  :ensure t
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :config (progn
            (setq org-directory "~/Documents/Notes")
            (setq org-default-notes-file (concat org-directory "/notes.org"))

            ;; english dates regardless of the system locale
            (setq system-time-locale "C")

            ;; enable auto-indentation with proper line-wrapping
            (setq org-startup-indented t)
            (add-hook 'org-mode-hook 'visual-line-mode)

            ;; org-agenda configuration
            (setq org-agenda-files `(,(concat org-directory "/tickler.org")
                                     ,(concat org-directory "/tickler.org_archive")
                                     ,(concat org-directory "/gtd.org")
                                     ,(concat org-directory "/gtd.org_archive")
                                     ,(concat org-directory "/inbox.org")
                                     ,(concat org-directory "/someday.org")))
            ;; capture templates
            (setq org-capture-templates `(("t" "Todo [inbox]" entry
                                           (file+headline ,(concat org-directory "/inbox.org") "Inbox")
                                 "* TODO %i%?")
                                          ("T" "Tickler" entry
                                           (file+headline ,(concat org-directory "/tickler.org") "Tickler")
                                           "* %i%? \n %U")))

            (setq org-refile-use-outline-path t)
            (setq org-refile-targets '((nil :maxlevel . 3)
                                       (org-agenda-files :maxlevel . 9)))

            ;; workflow steps
            (setq org-todo-keywords '((sequence "TODO(t)" "WIP(w)" "REVIEW(r)" "|" "DONE(d@)" "CANCELED(c@)")))

            ;; persist clock across sessions
            (setq org-clock-persist 'history)
            (org-clock-persistence-insinuate)

            ;; other configs
            (setq org-hide-leading-stars t)
            (setq org-src-fontify-natively t)))

;; sanitize minor mode names

(use-package diminish
  :ensure t
  :config (progn
            (diminish 'paredit-mode " ()")
            (diminish 'flyspell-mode " ~")
            (diminish 'eldoc-mode " doc")))
