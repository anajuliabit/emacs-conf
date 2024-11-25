;;; feat.shell.el --- Shell configurations -*- lexical-binding: t; -*-

;;; Commentary:
;;; Shell configurations

;;; Code:
(use-package aweshell
  :straight (aweshell :type git :host github :repo "manateelazycat/aweshell")
  :load-path "~/elisp"
  :bind (("M-SPC" . aweshell-new)))

(provide 'feat.shell)
;;; feat.shell.el ends here
 
