;;;;
;; Swift
;;;;

(require 'company-sourcekit)

;; Syntax check
(eval-after-load "swift-mode"
  '(progn
     (add-to-list 'flycheck-checkers 'swift)))

;; Authocompletion with SourceKittenDaemon (https://github.com/terhechte/SourceKittenDaemon)
(add-to-list 'company-backends 'company-sourcekit)
