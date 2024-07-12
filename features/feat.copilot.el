;;; init-copilot.el --- AI code helper buddy guy. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :ensure t
  :hook ((prog-mode org-mode) . copilot-mode)
  :bind (("C-c M-f" . copilot-complete)
      :map copilot-completion-map
       ("C-g" . 'copilot-clear-overlay)
       ("M-p" . 'copilot-previous-completion)
       ("M-n" . 'copilot-next-completion)
       ("C-<tab>" . 'copilot-accept-completion)
       ("M-f" . 'copilot-accept-completion-by-word)
       ("M-<return>" . 'copilot-accept-completion-by-line)))
 ;; :config
 ;; (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
 ;; (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
 ;; (define-key copilot-completion-map (kbd "C-]") 'copilot-next-completion)
 ;; (define-key copilot-completion-map (kbd "C-[") 'copilot-previous-completion)
;; (define-key copilot-completion-map (kbd "C-g") 'copilot-clear-overlay)

(provide 'feat.copilot)
;;; feat.copilot.el ends here
