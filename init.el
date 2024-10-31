;; init.el --- Main entry for Emacs configuration -*- lexical-binding: t; -*

;;; Commentary:
;;; Code:


(defvar config-path (expand-file-name "~/emacs")
  "Path to nix-dotfiles.")
(load (expand-file-name "core/core.configuration.el" config-path))
(load (expand-file-name "core/core.straight.el" config-path))
(load (expand-file-name "features/feat.completion.el" config-path))
(load (expand-file-name "features/feat.editor.el" config-path))
(load (expand-file-name "features/feat.evil.el" config-path))
(load (expand-file-name "features/feat.functions.el" config-path))
(load (expand-file-name "features/feat.git.el" config-path))
(load (expand-file-name "features/feat.hydra.el" config-path))
(load (expand-file-name "features/feat.org.el" config-path))
(load (expand-file-name "features/feat.llm.el" config-path))
(load (expand-file-name "features/feat.syntaxchecking.el" config-path))
(load (expand-file-name "features/feat.modeline.el" config-path))
(load (expand-file-name "features/feat.formatting.el" config-path))
(load (expand-file-name "features/feat.theme.el" config-path))
(load (expand-file-name "features/feat.shell.el" config-path))
(load (expand-file-name "languages/lang.typescript.el" config-path))
(load (expand-file-name "languages/lang.nix.el" config-path))
(load (expand-file-name "languages/lang.solidity.el" config-path))
(load (expand-file-name "languages/lang.javascript.el" config-path))
(load (expand-file-name "languages/lang.markdown.el" config-path))
(load (expand-file-name "languages/lang.elisp.el" config-path))

(provide 'init.el)
;;; init.el ends here
