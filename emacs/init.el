(package-initialize)
(add-to-list 'load-path "~/.emacs.d/vagrant.el/")
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ;;("melpa" . "http://melpa.milkbox.net/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ))


(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
;;(setq flymake-python-pyflakes-executable "flake8")

;; (defun init--install-packages ()
;;   (packages-install
;;    '(magit
;;      paredit
;;      move-text
;;      gist
;;      htmlize
;;      visual-regexp
;;      markdown-mode
;;      fill-column-indicator
;;      flycheck
;;      flycheck-pos-tip
;;      flycheck-clojure
;;      dired-details
;;      css-eldoc
;;      yasnippet
;;      smartparens
;;      ido-vertical-mode
;;      ido-at-point
;;      simple-httpd
;;      guide-key
;;      nodejs-repl
;;      restclient
;;      highlight-escape-sequences
;;      whitespace-cleanup-mode
;;      elisp-slime-nav
;;      dockerfile-mode
;;      clojure-mode
;;      clojure-mode-extra-font-locking
;;      groovy-mode
;;      prodigy
;;      cider
;;      yesql-ghosts
;;      string-edit
;;      )))
;; (condition-case nil
;;     (init--install-packages)
;;   (error
;;    (package-refresh-contents)
;;    (init--install-packages)))


;; (load-file "~/source/java/cedet/cedet-devel-load.el")
;; (add-hook 'after-init-hook (lambda ()
;; time?
(iswitchb-mode 1) ;; obsolete my arse
(which-func-mode 1)


(global-set-key [(meta left)] 'windmove-left)
(global-set-key [(meta right)] 'windmove-right)
(global-set-key [(meta up)] 'windmove-up)
(global-set-key [(meta down)] 'windmove-down)
(global-set-key [()] 'comment-or-uncomment-region)
;; (global-set-key (kbd "C-c c") 'comment-or-uncomment-region )
;; (global-set-key (kbd "C-c c") 'comment-or-uncomment-region )
(global-set-key (kbd "C-c c") 'comment-region )
(global-set-key (kbd "C-c u") 'uncomment-region )

;; (load-file "~/.emacs.d/elpa/color-theme-6.6.1/color-theme.el")
;;(require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-actress)))
;;(color-theme-initialize)
;;(color-theme-calm-forest)

;; (load-file "~/.emacs.d/elpa/color-theme-actress-0.2.2/color-theme-actress.el")
;; (color-theme-actress)

;; (load-file "~/.emacs.d/elpa/color-theme-gruber-darker-1/color-theme-gruber-darker.el")
;; (color-theme-gruber-darker)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-lein-command "/opt/lein")
 '(custom-enabled-themes (quote (tango-dark)))
 '(display-time-mode t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(emms-player-list nil)
 '(flymake-luac-program "/home/stephan/source/lua/5.1/bin/luac")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(magit-diff-show-diffstat nil)
 '(max-lisp-eval-depth 6000)
 '(max-specpdl-size 4340)
 '(scheme-program-name "/home/stephan/source/tinyscheme/tinyscheme-1.41/scheme")
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "grey70"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#b0b1a4")))))

