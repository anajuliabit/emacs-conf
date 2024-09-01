;;; feat.org.el --- Org mode setup -*- lexical-binding: t; -*-

;;; Commentary:

;;; Org mode configuration and setup

;;; Code:


(use-package org
  :ensure nil
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)
  :config
         (when (file-directory-p "~/org/agenda/")
           (setq org-agenda-files (list "~/org/agenda/")))
           (setq org-default-notes-file "~/org/notes/inbox.org")
           ;;; calls my/org-mode-setup when org-mode is enabled
           (add-hook 'org-mode 'my/org-mode-setup)
  :map org-mode-map (("C-c C-p" . eaf-org-export-to-pdf-and-open)
                      ("C-c ;" . nil)))

)

(defun my/org-mode-setup ()
 (org-bullets-mode 1)
  (org-indent-mode)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil)
  (diminish org-indent-mode) 
 )
  ;; Prettify UI
(use-package org-modern
  :straight t
  :hook ((org-mode . org-modern-mode)
         (org-agenda-finalize . org-modern-agenda)
         (org-modern-mode . (lambda ()
                              "Adapt `org-modern-mode'."
                              ;; Disable Prettify Symbols mode
                              (setq prettify-symbols-alist nil)
                              (prettify-symbols-mode -1)))))
(use-package org-roam
  :straight t
  :init
  (setq org-roam-directory (file-truename "~/.org/notes/main")
        org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag))
        )
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         )
  :config
  (setq org-roam-database-connector 'sqlite-builtin)
  (org-roam-db-autosync-mode))

(use-package org-roam-ui
  :straight t
  :bind ("C-c n u" . org-roam-ui-mode)
  :init (when (featurep 'xwidget-internal)
          (setq org-roam-ui-browser-function #'xwidget-webkit-browse-url)))


(use-package ox-slack
  :straight t
)


;;; Hide the emphasis markup
;;; (e.g. /.../ for italics, *...* for bold, etc.)
(setq org-hide-emphasis-markers t)

;;; TODO keywords
(setq org-todo-keywords (quote ((sequence "TODO(t)" "IN PROGRESS" "NEXT(s)" "|" "DONE(d!/!)")
                                (sequence "WAITING(w@/!)" "SOMEDAY(S)" "MEETING(P@)" "|" "CANCELLED(c@/!)")))
)
;; Define the custum capture templates
(setq org-capture-templates
       '(("t" "Todo" entry (file org-default-notes-file)
	  "* TODO %?\n%u\n%a\n" :clock-in t :clock-resume t)
	 ("m" "Meeting" entry (file org-default-notes-file)
	  "* MEETING with %? :MEETING:\n%t" :clock-in t :clock-resume t)
	 ("j" "Journal" entry (file+datetree "~/org/notes/journal.org")
	  "* %?\n%U\n" :clock-in t :clock-resume t)
	 ("i" "Idea" entry (file org-default-notes-file)
	  "* %? :IDEA: \n%t" :clock-in t :clock-resume t)
	 ("n" "Next Task" entry (file+headline org-default-notes-file "Tasks")
	  "** NEXT %? \nDEADLINE: %t") ))

;; Set default column view headings: Task Total-Time Time-Stamp
(setq org-columns-default-format "%50ITEM(Task) %10CLOCKSUM %16TIMESTAMP_IA")
(setq org-agenda-tags-column org-tags-column)
(setq org-agenda-sticky t)
(setq org-agenda-inhibit-startup nil)
(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block agenda view (disabled)
(setq org-agenda-compact-blocks nil)

;; Set the times to display in the time grid
(setq org-agenda-time-grid
      (quote
       ((daily today remove-match)
        (800 1200 1600 2000)
        "......" "----------------")))


(provide 'feat.org)
;;; feat.org.el ends here
