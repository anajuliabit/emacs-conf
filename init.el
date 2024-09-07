;; init.el --- Main entry for Emacs configuration -*- lexical-binding: t; -*

;;; Commentary:
;;; Code:

;; Native compilation stuff
(setq comp-speed 2)
(setq package-native-compile t)
(setq native-comp-async-report-warnings-errors nil)
(setq native-comp-deferred-compilation-deny-list nil)

;; Disable package.el as we are using straight
(setq package-enable-at-startup nil)

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
(load (expand-file-name "features/feat.copilot.el" config-path))
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
