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

(use-package diminish
  :straight t)

(use-package counsel
  :straight t
  :bind
  (("M-x" . counsel-M-x)
   ("C-c g" . counsel-ag)
   ("C-x C-f" . counsel-find-file)))

(setq counsel-ag-base-command "ag --nocolor --nogroup --ignore test/mutation %s")

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

(use-package ivy-rich
  :straight t
  :config
  (ivy-rich-mode t))

(use-package lsp-ivy
  :straight t)

(use-package wgrep-ag
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
  :bind (("C-c p p" . projectile-switch-project)
         ("C-c p s s" . projectile-ag)
         ("C-c p s r" . projectile-ripgrep))
  :config
  (projectile-mode t)
  (setq projectile-keymap-prefix (kbd "C-c p"))
  (setq projectile-use-git-grep t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-enable-caching t)
  (setq projectile-switch-project-action 'projectile-dired)
)

;;; Undo visualization
(use-package undo-tree
  :disabled
  :straight t
  ;;:diminish undo-tree-mode)
 )

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

;; log files
(use-package logview
  :straight t)

(use-package eat
  :straight t
 )

(add-hook 'eshell-load-hook #'eat-eshell-mode)

(use-package exec-path-from-shell
  :straight t
  :init
  (exec-path-from-shell-initialize))

(setq long-line-threshold nil)

;;(use-package which-key
;;  :diminish which-key-mode
;;  :config
;;  (which-key-mode)
;;  (setq which-key-idle-delay 0.3))

(use-package iedit
  :straight t
  :bind
  ("C-;" . iedit-mode))

;; completions
(use-package vertico
  :bind (:map vertico-map
         ("C-j" . vertico-next)
         ("C-k" . vertico-previous)
         ("C-f" . vertico-exit)
         :map minibuffer-local-map)
  :custom
  (vertico-cycle t)
  :custom-face
  (vertico-current ((t (:background "#3a3f5a"))))
  :config
  (vertico-mode))

;; completions annotations
(use-package marginalia
  :after vertico
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode 1))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . helpful-function)
  ([remap describe-symbol] . helpful-symbol)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-command] . helpful-command)
  ([remap describe-key] . helpful-key))

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package smerge-mode
  :ensure nil
  :hook
  (prog-mode . smerge-mode)
  ;; add a bind to replace the start C-C ^  for  C-C s 
  )

(provide 'feat.editor)
;;; feat.editor.el ends here
