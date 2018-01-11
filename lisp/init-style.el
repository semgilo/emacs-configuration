
;;----------------------------------------------------------------------------
;;  GUI 
;;----------------------------------------------------------------------------
;; Redefine some default
(setq-default cursor-type 'bar)
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq inhibit-splash-screen t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


;; Disable some mijor modes
(tool-bar-mode -1)
;;(scroll-bar-mode -1)
(auto-save-mode -1)

;; Enable some mijor modes
(linum-mode t)
(delete-selection-mode t)
(global-hl-line-mode t)

;;----------------------------------------------------------------------------
;;  Operation 
;;----------------------------------------------------------------------------
(require 'ido)
(ido-mode t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(require-package 'hungry-delete)
(require 'hungry-delete)
(global-hungry-delete-mode)

(require-package 'multiple-cursors)
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(provide 'move-text)


(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

;;----------------------------------------------------------------------------
;;  Theme
;;----------------------------------------------------------------------------
(require-package 'monokai-theme)
(load-theme 'monokai t)


(provide 'init-style)
