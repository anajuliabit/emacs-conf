;;; feat.editor.el --- Editor improvements -*- lexical-binding: t; -*-

;;; Commentary:
;;; Replacements and improvements for Emacs behaviour

;;; Code:
;;; Clean emacs configuration with no littering
(use-package no-littering
  :straight t
  :init
  (require 'recentf)
  :config
  (setq auto-save-file-name-transforms
	`((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
  (add-to-list 'recentf-exclude no-littering-var-directory)
  (add-to-list 'recentf-exclude no-littering-etc-directory))

;;; Diminish
(use-package diminish
  :straight t)

;;; counsel
(use-package counsel
  :straight t
  :bind
  (("M-x" . counsel-M-x)
   ("C-c g" . counsel-ag)
   ("C-x C-f" . counsel-find-file)))

;;; ivy - generic completion frontend
(use-package ivy
  :straight t
  :diminish ivy-mode
  :config
  (setq enable-recursive-minibuffers nil)
  (setq ivy-display-style 'fancy)
  (setq ivy-height 35)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-magic-slash-non-match-action nil)
  (defun swiper-recenter ()
    "Advice swiper to recenter on exit."
    (recenter))
  (advice-add 'swiper :after #'swiper-recenter)
  (ivy-mode t))

(use-package wgrep-ag
  :straight t)

(use-package ivy-rich
  :straight t
  :config
  (ivy-rich-mode t))

(use-package lsp-ivy
  :straight t)

;;; swiper - isearch replacement
(use-package swiper
  :straight t
  :bind
  (("C-s" . swiper)))

;;; avy - jump to characters and expressions fast
(use-package avy
  :straight t
  :custom-face
  :config
  (setq avy-background t)
  (setq avy-all-windows t)
  (custom-set-faces
   '(avy-lead-face
     ((t (:inherit avy-lead-face
                   :background "#eeeeee"
                   :foreground "#424242"))))
   '(avy-lead-face-0
     ((t (:inherit avy-lead-face-0
                   :background "#feca32"
                   :foreground "#424242")))))
  :bind
  (("C-c a" . avy-goto-char)
   ("C-c o" . avy-goto-char-timer)
   ("C-c e" . swiper-avy)))

(use-package counsel-projectile
  :straight t
  :after (counsel projectile)
  :bind
  (("s-p" . counsel-projectile)
   ("s-f" . counsel-projectile-find-file)
   ("s-b" . counsel-projectile-switch-to-buffer))
  )

;;; Project management
(use-package projectile
  :straight t
  :diminish projectile-mode
  :config
  (projectile-mode t)
  (setq projectile-use-git-grep t)
  (setq projectile-completion-system 'ivy)
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-directories "lib")
  (add-to-list 'projectile-globally-ignored-directories "out")
  (setq projectile-switch-project-action #'projectile-commander)
  (def-projectile-commander-method ?s
                                   "Open a *eshell* buffer for the project."
                                   (projectile-run-eshell))
  (def-projectile-commander-method ?c
                                   "Run `compile' in the project."
                                   (projectile-compile-project nil))
  (def-projectile-commander-method ?d
                                   "Open project root in dired."
                                   (projectile-dired))
  (def-projectile-commander-method ?s
                                   "Git fetch."
                                   (magit-status)
                                   (call-interactively #'magit-fetch-current))
  (def-projectile-commander-method ?f
                                   "Find file"
                                   (counsel-projectile-find-file)))
;;; Undo visualization
(use-package undo-tree
  :disabled
  :straight t
  :diminish undo-tree-mode)

;; Highlight parantheses
(use-package highlight-parentheses
  :straight t
  :hook ((prog-mode . highlight-parentheses-mode)
         (prog-mode . show-paren-mode)))

;; dashboard
(use-package dashboard
  :straight t
  :init
  (dashboard-setup-startup-hook)
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents  . 10)
                          (projects . 3)
                          (registers . 5)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)
  (setq dashboard-set-footer nil)
  (setq dashboard-banner-logo-title "Have a good coding session")
  (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*"))))

;; view large files
(use-package vlf
  :straight t
  :config
  (require 'vlf-setup))

;; string inflection
(use-package string-inflection
  :straight t
  :config
  (require 'string-inflection))

;; log files
(use-package logview
  :straight t)

;; editorconfig
(use-package editorconfig
  :straight t
  :config
  (editorconfig-mode 1))

(use-package eat
  :straight t
 )

(use-package exec-path-from-shell
  :straight t
  :init
  (exec-path-from-shell-initialize))

(exec-path-from-shell-initialize)

(add-hook 'eshell-load-hook #'eat-eshell-mode)

(setq long-line-threshold nil)

(provide 'feat.editor)
;;; feat.editor.el ends here
