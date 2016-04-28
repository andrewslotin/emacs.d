;;;;
;; Go
;;;;

(require 'flycheck)

;; Syntax check with goflymake
(eval-after-load "go-mode"
  '(progn
     ;; Load go-guru
     (if
         (file-exists-p (concat (getenv "GOPATH") "/src/golang.org/x/tools/cmd/guru/go-guru.el"))
         (load-file (concat (getenv "GOPATH") "/src/golang.org/x/tools/cmd/guru/go-guru.el"))
         (warn "go-guru.el was not found. To install it run `go get golang.org/x/tools/cmd/guru`"))
  
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
