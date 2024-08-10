;;; init-copilot.el --- Copilot -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el" :files ("dist" "*.el"))
  :ensure t
  :hook ((prog-mode org-mode) . copilot-mode)
  :bind (("C-c M-f" . copilot-complete)
      :map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)
              ("C-n" . 'copilot-next-completion)
              ("C-p" . 'copilot-previous-completion))
 :config
  (add-to-list 'copilot-indentation-alist `(prog-mode 4))
  (add-to-list 'copilot-indentation-alist `(emacs-lisp-mode 4)))

(provide 'feat.copilot)
;;; feat.copilot.el ends here
