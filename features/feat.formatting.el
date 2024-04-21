;;; feat.formatting.el --- Code formatting tools -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:
;;(use-package format-all
;;  :straight t)
;;

(defun maybe-use-prettier ()
  "Enable prettier-js-mode if an rc file is located."
  (if (locate-dominating-file default-directory ".prettierrc")
      (prettier-js-mode +1)))

(use-package prettier-js
  :straight t
  :hook
  ((solidity-mode . maybe-use-prettier)
   (js2-mode  . maybe-use-prettier)
   (typescript-mode . maybe-use-prettier)
   (before-save . prettier-js)
   ))

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
