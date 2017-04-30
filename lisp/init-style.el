
;;----------------------------------------------------------------------------
;;  GUI 
;;----------------------------------------------------------------------------
;; Redefine some default
(setq-default cursor-type 'bar)
(setq-default make-backup-files nil)

;; Disable some mijor modes
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Enable some mijor modes
(linum-mode t)

(require 'ido)
(ido-mode t)


;;----------------------------------------------------------------------------
;;  Theme
;;----------------------------------------------------------------------------



(provide 'init-style)
