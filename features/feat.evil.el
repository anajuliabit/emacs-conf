;;; feat.evil.el --- Evil configuration -*- lexical-binding: t; -*-

;;; Commentary:
;;; VIM emulation for Emacs = Evil

;;; Code:
(setq-default evil-want-C-u-scroll t)
(setq-default evil-want-integration t)
(setq-default evil-want-keybinding nil)

(use-package goto-chg
  :straight t)

(use-package evil-leader
  :straight t
  :after evil
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "a"        'align-regexp
    "o"        'sort-lines
    "b"        'ivy-switch-buffer
    "i"        'ibuffer
    "u"        'hydra/lsp-ui/body
    "n"        'ivy-switch-buffer-other-window
    "k"        'ido-kill-buffer
    "s"        'magit-status
    "p"        'projectile-switch-project
    "f"        'counsel-projectile-find-file
    "g"        'counsel-ag
    "d"        'counsel-dired
    "w"        'save-buffer
    "j"        'swiper-avy
    "t"        'treemacs
    "y"        'yas-insert-snippet
    "q"        'kill-current-buffer
    "r"        'reload-current-buffer
    "ü"        'browse-url-at-point
    "?"        'flyspell-correct-at-point
    "!"        'flyspell-add-word-to-dict
    "m"        'hydra/multiple-cursors/body
    "1"        'hydra/window-management/body
    "<C-up>"   'move-line-up
    "<C-down>" 'move-line-down

    "TAB"      'indent-region
    "RET"      'eval-buffer

    "<up>"     'beginning-of-defun
    "<down>"   'end-of-defun

    "("        'lispy-parens
    "{"        'lispy-braces
    "["        'lispy-brackets
    "\""       'lispy-quotes
    "*"        'lispy-asterisk
    "/"        'lispy-slash
    "          '" 'lispy-singlequote
    "~"        'lispy-tilde
    "<"        'lispy-angle-brackets
    "`"        'lispy-backticks))

(use-package evil
  :straight t
  :config
  (setq-default evil-undo-system 'undo-redo)
  ;; Avoid cutting on pasting
  (setq-default evil-undo-system 'undo-redo)
  (setq-default evil-kill-on-visual-paste nil)
  (setq-default evil-search-module 'evil-search)
  (setq-default evil-ex-visual-char-range t)
  (evil-mode t))

(use-package evil-collection
  :straight t
  :after evil
  :config
  (setq-default evil-collection-setup-minibuffer t)
  (setq-default evil-collection-company-use-tng nil)
  (evil-collection-init))


(use-package evil-mc
  :straight t
  :after evil
  :config
  (setq evil-mc-one-cursor-show-mode-line-text t)
  (global-evil-mc-mode t))

;; Evil surround allows quick text object changes
;; e.g. c-s ( { to swap the parantheses a region is
;; surrounded by from () to {}
(use-package evil-surround
  :straight t
  :after evil
  :config
  (global-evil-surround-mode t))

(use-package tree-sitter
  :straight t)

(use-package tree-sitter-langs
  :straight t)

(provide 'feat.evil)
;;; feat.evil.el ends here
