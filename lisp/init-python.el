(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)

(when (maybe-require-package 'anaconda-mode)
  (after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
  (when (maybe-require-package 'company-anaconda)
    (after-load 'company
      (after-load 'python
        (push 'company-anaconda company-backends)))))

(setq url-proxy-services
      '(("no_proxy" . "^\\(127.0.0.1\\|localhost\\|10.*\\)")
	("http" . "127.0.0.1:6152")
	("https" . "127.0.0.1:6152")))
(provide 'init-python)
