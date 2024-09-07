;;; lang.elisp.el --- Lisp language setup -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(use-package emacs-lisp-mode
  :straight nil
  :mode-hydra
  (emacs-lisp-mode
   ("Eval"
    (("b" eval-buffer "buffer")
     ("e" eval-defun "defun")
     ("r" eval-region "region"))
    "REPL"
    (("I" ielm "ielm"))
    "Test"
    (("t" ert "prompt")
     ("T" (ert t) "all")
     ("F" (ert :failed) "failed"))
    "Doc"
    (("d" describe-foo-at-point "thing-at-pt")
     ("f" describe-function "function")
     ("v" describe-variable "variable")
     ("i" info-lookup-symbol "info lookup")))
   )
 )

(provide 'lang.elisp)
;;; lang.elisp.el ends here
