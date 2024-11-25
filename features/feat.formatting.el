;;; feat.formatting.el --- Code formatting tools -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:
;;(use-package format-all
;;  :straight t)
;;

;;(use-package reformatter
;;    :straight t
;;    :config
;;    (reformatter-define prettier-js
;;        :program "prettier"
;;        :args '("--stdin-filepath" "file")
;;        :lighter " Prettier"))


(defun run-prettier-before-save ()
  "Run prettier-js if prettier-js-mode is enabled."
  (when prettier-js-mode
    (prettier-js)))

(use-package prettier-js
  :straight t
  :hook ((solidity-mode . prettier-js-mode)
         (js2-mode . prettier-js-mode)
         (typescript-ts-mode . prettier-js-mode)
         (yaml-mode . prettier-js-mode)
         (before-save . run-prettier-before-save))
)


;;(use-package hungry-delete
;;  :straight t
;;  :hook (prog-mode . hungry-delete-mode))
;;
;;(use-package simple
;;  :straight t
;;  :hook (before-save . delete-trailing-whitespace))
;;
(provide 'feat.formatting)
;;; feat.formatting.el ends here
