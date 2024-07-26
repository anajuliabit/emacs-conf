;;; lang.typescript.el --- Typescript configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Configuration of Typescript and tooling

;;; Code:
;;  tree-sitter indentation minor mode for Emacs
(use-package tsi
  :straight (tsi
            :type git
            :host github
            :repo "orzechowskid/tsi.el"))

(use-package typescript-ts-mode
  :straight nil
  :after eglot
  :init
  (add-to-list 'eglot-server-programs
               '(typescript-ts-mode "typescript-language-server" "--stdio"))
  :hook (typescript-ts-mode . eglot-ensure)
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . typescript-ts-mode)))


(use-package tide
  :straight t
  :after
  (typescript-mode company flycheck)
  :config
  (setq company-tooltip-align-annotations t)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (flycheck-add-mode 'typescript-tslint 'web-mode)
  (defun typescript-company-mode-hook ()
    (setq-local company-backends
                '((company-tide :with company-dabbrev company-yasnippet))))
  (add-hook 'typescript-mode #'typescript-company-mode-hook)
    :hook
  ((typescript-mode . tide-setup)
   (typescript-mode . flycheck-mode)
   (typescript-mode . eldoc-mode)
   (typescript-mode . company-mode)
   (typescript-mode . tide-hl-identifier-mode)))

(provide 'lang.typescript)
;;; lang.typescript.el ends here
