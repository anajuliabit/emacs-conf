;;; lang.solidity.el --- Solidity language setup -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:
(use-package solidity-mode
  :ensure t
  :mode ("\\.sol\\'" . solidity-mode)
  :config
  (setq solidity-comment-style 'slash)
  (setq solidity-solium-path "/usr/local/bin/solium")
  (setq solidity-flycheck-solc-checker-active t)
  (setq solidity-flycheck-solium-checker-active t)
  )

;;(use-package solidity-flycheck
;;  :straight (solidity-flycheck :type git :host github :repo "ethereum/emacs-solidity")
;;  :hook solidity-mode
;;  :config
;;  (setq solidity-flycheck-chaining-error-level t)
;;  (setq solidity-flycheck-use-project t))


(use-package solidity-flycheck
  :straight t
  :defer 20
  :ensure t
  :config
  (setq solidity-flycheck-solc-additional-allow-paths
        '("/lib"))
  (setq solidity-flycheck-solc-remappings
        '("@openzeppelin-contracts=lib/openzeppelin-contracts")))

;;(use-package company-solidity
;;  :straight t
;;  :defer 20
;;  :ensure t)

;; disable code actions in modeline as it's slow down a lot
(defun disable-lsp-modeline-code-actions-for-solidity ()
  "Disable lsp modeline code actions in solidity mode."
  (when (derived-mode-p 'solidity-mode)
    (lsp-modeline-code-actions-mode -1)))

(add-hook 'solidity-mode-hook 'disable-lsp-modeline-code-actions-for-solidity)


(provide 'lang.solidity)
;;; lang.solidity.el ends here
