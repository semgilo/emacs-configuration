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
    (let (find-file proj_conf_path)
      (switch-to-buffer ".dir-locals.el")
      (insert (format "((nil . ((ffip-project-root . \"%s\") \n" path))
      (insert (format "\t;; ingore files bigger than 64k and directory \"dist/\" \n"))
      (insert (format "\t(ffip-find-options . \"-not -size +64k -not -iwholename '*/dist/*'\")\n"))
      (insert (format "\t;; only search files with following extensions\n"))
      (insert (format "\t(ffip-patterns . (\"*.html\" \"*.js\" \"*.css\" \"*.java\" \"*.xml\" \"*.js\"))\n"))
      (insert (format "\t(eval . (progn\n"))
      (insert (format "\t\t(require 'find-file-in-project)\n"))
      (insert (format "\t\t;; ingore directory \".tox/\"\n"))
      (insert (format "\t\t(setq ffip-prune-patterns `(\"*/.tox/*\" ,@ffip-prune-patterns))\n"))
      (insert (format "\t\t;; Do NOT ignore directory \"bin/\"\n"))
      (insert (format "\t\t(setq ffip-prune-patterns `(delete \"*/bin/*\" ,@ffip-prune-patterns))))\n"))
      (insert (format "\t)))\n"))
      (save-buffer "~/Documents/1.el")))
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



(global-set-key (kbd "C-c C-l") 'semgilo/open-lua-project)

(provide 'init-lua)
