;;; This file bootstraps the configureation, which is devided into
;;; a number of other files

(let ((minver "24.1"))
  (when (version<= emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version<= emacs-version "24.4")
  (message "Your Emacs is old, and some functinality in this config will be disabled, Please upgrade if possible."))


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *is-a-mac* (eq system-type 'darwin))


(require 'init-base-gui)
