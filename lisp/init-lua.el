;;

(require-package 'lua-mode)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(defun semgilo/open-lua-project ( path )
  (interactive "DInpurt project root: ")
  (if (equal path "")
      (setq path (format-time-string "%Y%m%d_%H%M%S")))
  (message path)
  (setq proj_conf_path
        (concat path
		".dir-locals.el"))
  (message proj_conf_path)
  (if (file-exists-p proj_conf_path)
      (message "file has been exists")
    ((find-file proj_conf_path)
     (insert (format "((nil . ((ffip-project-root . \"%s\") \n" path))
     (save-buffer)
     (kill-buffer)))

  ;; ((nil . ((ffip-project-root . "~/projs/PROJECT_DIR")
  ;;        ;; ingore files bigger than 64k and directory "dist/"
  ;;        (ffip-find-options . "-not -size +64k -not -iwholename '*/dist/*'")
  ;;        ;; only search files with following extensions
  ;;        (ffip-patterns . ("*.html" "*.js" "*.css" "*.java" "*.xml" "*.js"))
  ;;        (eval . (progn
  ;;                  (require 'find-file-in-project)
  ;;                  ;; ingore directory ".tox/"
  ;;                  (setq ffip-prune-patterns `("*/.tox/*" ,@ffip-prune-patterns))
  ;;                  ;; Do NOT ignore directory "bin/"
  ;;                  (setq ffip-prune-patterns `(delete "*/bin/*" ,@ffip-prune-patterns))))
  ;;        )))
  )

;; (global-set-key "\c-c\ \c-l" 'semgilo/open-lua-project)

(provide 'init-lua)
