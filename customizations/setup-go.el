;;;;
;; Go
;;;;



;; Syntax check with goflymake
(eval-after-load "go-mode"
  '(progn
     (flycheck-define-checker go-gofmt
                               "A Go syntax and style checker using the gofmt utility."
                               :command ("goimports" "-e" source)
                               :error-patterns ((error line-start (file-name) ":" line ":" column ": " (message) line-end))
                               :modes 'go-mode)
     (add-to-list 'flycheck-checkers 'go-gofmt)))

(defun custom-go-mode-hook()
  ;; Run goimports on save
  (setq gofmt-command "goimports")
  (add-to-list 'exec-path (concat (getenv "GOPATH") "/bin"))
  (add-hook 'before-save-hook 'gofmt-before-save)

  ;; Jump to definition key binding
  (local-set-key (kbd "M-.") 'godef-jump-other-window)

  ;; Autocompletion
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)
)

(add-hook 'go-mode-hook 'custom-go-mode-hook)
