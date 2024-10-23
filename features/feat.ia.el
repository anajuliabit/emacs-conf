;;; init-copilot.el --- Copilot -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(straight-use-package 'gptel)

(use-package gptel
  :custom
  (gptel-model 'claude-3-5-sonnet-20240620)
  :config
  (defun read-file-contents (file-path)
    "Read the contents of FILE-PATH and return it as a string."
    (with-temp-buffer
      (insert-file-contents file-path)
      (buffer-string)))
  (defun gptel-api-key ()
    (read-file-contents "~/secrets/claude_key"))
  (setq
   gptel-backend (gptel-make-anthropic "Claude"
                   :stream t
                   :key #'gptel-api-key)))



(provide 'feat.ia)
;;; feat.ia.el ends here
