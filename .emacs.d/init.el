;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))

(package-initialize)

(push "/usr/local/bin" exec-path)
(setq default-directory "~/.emacs.d/")

(add-to-list 'load-path (expand-file-name "./lisp/" default-directory))

(load "functions")
(load "env")
(load "packages")
(load "editor")
(load "ui")

(load "server")
(unless (server-running-p)
  (server-start))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)

(use-package dired-subtree
  :config
  (bind-keys :map dired-mode-map
             ("i" . dired-subtree-insert)
             (";" . dired-subtree-remove)))

(require 'spotify)

(setq spotify-oauth2-client-secret "")
(setq spotify-oauth2-client-id "")
(define-key spotify-mode-map (kbd "C-c .") 'spotify-command-map)
(setq spotify-transport 'connect)
(setq spotify-player-status-refresh-interval 10)
(setq spotify-player-status-truncate-length 60)
(setq spotify-status-location 'title-bar)
(setq spotify-title-bar-separator "----")

(setq gofmt-command "goimports")
(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)





(put 'erase-buffer 'disabled nil)
