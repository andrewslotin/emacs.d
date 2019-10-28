;;;;
;; Go
;;;;

(use-package flycheck
  :ensure t)

(use-package go-guru
  :defer)

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :config (progn
            (setq lsp-enable-snippet nil)
            (setq lsp-prefer-flymake nil)))

(use-package company
  :ensure t
  :config (progn
            (setq company-idle-delay 0)
            (setq company-tooltip-align-annotations t)))

(use-package company-lsp
  :ensure t
  :commands company-lsp)

(use-package go-mode
  :ensure t
  :init (add-to-list 'exec-path (concat (getenv "GOPATH") "/bin"))
  :config (progn
            (setq gofmt-command "goimports"))
  :bind (
         ("M-." . lsp-find-definition)
        )
  :hook ((go-mode . lsp-deferred)
         (before-save . lsp-organize-imports)
         ))

(provide 'gopls-config)
