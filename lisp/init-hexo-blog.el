(require-package 'hexo)

(require 'hexo)

(defun hexo-my-blog ()
  (interactive)
  (hexo "~/Documents/Github/www.lanhuzi.com/"))

(provide 'init-hexo-blog)