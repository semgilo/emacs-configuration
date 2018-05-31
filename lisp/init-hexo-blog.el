(require-package 'hexo)

(require 'hexo)

(defun hexo-my-blog ()
  (interactive)
  (hexo "~/Documents/Github/www.lanhuzi.com/"))


(defun semgilo/insert-org-img-link (prefix imagename)
  (if (equal (file-name-extension (buffer-file-name)) "org")
      (insert (format "[[%s][%s%s]]" imagename prefix imagename))
    (insert (format "![%s](%s%s)" imagename prefix imagename))))

(defun semgilo/capture-screenshot (basename)
  "Take a screenshot into a time stamped unique-named file in the
  same directory as the org-buffer/markdown-buffer and insert a link to this file."
  (interactive "sScreenshot name: ")
  (if (equal basename "")
      (setq basename (format-time-string "%Y%m%d_%H%M%S")))
  (setq fullpath
        (concat (file-name-directory (buffer-file-name))
                "../images/posts/"
                (file-name-base (buffer-file-name))
                "_"
                basename))
  (setq relativepath
        (concat (file-name-base (buffer-file-name))
                "_"
                basename
                ".png"))

  (if (file-exists-p (file-name-directory fullpath))
      (progn
        (call-process "screencapture" nil nil nil "-s" (concat fullpath ".png"))
        (semgilo/insert-org-img-link "https://www.lanhuzi.com/img/" relativepath))
    (progn
      (call-process "screencapture" nil nil nil "-s" (concat basename ".png"))
      (semgilo/insert-org-img-link "./" (concat basename ".png"))))
  (insert "\n"))

(defun semgilo/record-screencapture (basename)
  "Take a screenshot into a time stamped unique-named file in the
  same directory as the org-buffer/markdown-buffer and insert a link to this file."
  (interactive "sScreenshot name: ")
  (call-process "/Applications/LICPcap.app" nil 0)
  )
  
(global-set-key [C-s-268632065] 'semgilo/capture-screenshot)




(provide 'init-hexo-blog)
