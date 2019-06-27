;;

(require-package 'lua-mode)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))


(defconst TEMPLATE_CONTENT "((nil . ((ffip-project-root . \"%s\") 
         ;; ingore files bigger than 64k and directory \"dist/\" 
         (ffip-find-options . \"-not -size +64k -not -iwholename '*/dist/*'\") 
         ;; only search files with following extensions
         (ffip-patterns . (\"*.lua\"))
         (eval . (progn 
                   (require 'find-file-in-project)
                   ;; ingore directory \".tox/\"
                   (setq ffip-prune-patterns `(\"*/.tox/*\" ,@ffip-prune-patterns))
                   ;; Do NOT ignore directory \"bin/\"
                   (setq ffip-prune-patterns `(delete \"*/bin/*\" ,@ffip-prune-patterns)))) 
         )))")
(defun semgilo/open-lua-project ( path )
  (interactive "DInpurt project root: ")
  (message path)
  (setq proj_conf_path (concat path ".dir-locals.el"))
  ;; (message (format TEMPLATE_CONTENT proj_conf_path)) 
  (if (file-exists-p proj_conf_path)
      (delete-file proj_conf_path))
  (write-region (format TEMPLATE_CONTENT path) nil proj_conf_path)
)



(global-set-key (kbd "C-c C-l") 'semgilo/open-lua-project)
;;(global-set-key (kbd "s-p") 'find-file-in-project)
(provide 'init-lua)
