;; don't show the startup help screen
(setq inhibit-startup-screen t)

;; mode line settings
(column-number-mode t)
(line-number-mode t)
(size-indication-mode t)

;; remove clutter from the UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; blinking cursor
(blink-cursor-mode t)

;; enable mouse gestures in terminal
(require 'mouse)
(xterm-mouse-mode t)

;; disable alarm bell beep
(setq ring-bell-function 'ignore)

;; powerline customization
(setq powerline-arrow-shape 'arrow)

;; font
(custom-set-faces
 '(default ((t (:family "monospace" :height 120)))))
