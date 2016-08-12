;;;;
;; Rust
;;;;

(defun custom-rust-mode-hook()
  (add-hook 'before-save-hook 'rustfmt-format-buffer)
)

(add-hook 'rust-mode-hook 'custom-rust-mode-hook)
