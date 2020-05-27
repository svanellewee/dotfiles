
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(which-function-mode)

(dolist (package '(use-package magit go-mode unicode-fonts calmer-forest-theme dap-mode))
  (unless (package-installed-p package)
    (message (format "installing %s" package))
    (package-install package)))

(require 'use-package)
(require 'magit)

;; (unicode-fonts-setup)

(setq lsp-keymap-prefix "C-c l")
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

;; company-lsp integrates company mode completion with lsp-mode.
;; completion-at-point also works out of the box but doesn't support snippets.
(use-package company-lsp
  :ensure t
  :commands company-lsp)
(require 'dap-go)
;; Optional - provides snippet support.
(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))

;; (add-to-list 'load-path "~/.emacs.d/vagrant.el/")
;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ;;("melpa" . "http://melpa.milkbox.net/packages/")
;;                          ("melpa-stable" . "http://stable.melpa.org/packages/")
;;                          ))


;; (require 'flymake-python-pyflakes)
;; (add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
;; ;;(setq flymake-python-pyflakes-executable "flake8")

;; ;; (defun init--install-packages ()
;; ;;   (packages-install
;; ;;    '(magit
;; ;;      paredit
;; ;;      move-text
;; ;;      gist
;; ;;      htmlize
;; ;;      visual-regexp
;; ;;      markdown-mode
;; ;;      fill-column-indicator
;; ;;      flycheck
;; ;;      flycheck-pos-tip
;; ;;      flycheck-clojure
;; ;;      dired-details
;; ;;      css-eldoc
;; ;;      yasnippet
;; ;;      smartparens
;; ;;      ido-vertical-mode
;; ;;      ido-at-point
;; ;;      simple-httpd
;; ;;      guide-key
;; ;;      nodejs-repl
;; ;;      restclient
;; ;;      highlight-escape-sequences
;; ;;      whitespace-cleanup-mode
;; ;;      elisp-slime-nav
;; ;;      dockerfile-mode
;; ;;      clojure-mode
;; ;;      clojure-mode-extra-font-locking
;; ;;      groovy-mode
;; ;;      prodigy
;; ;;      cider
;; ;;      yesql-ghosts
;; ;;      string-edit
;; ;;      )))
;; ;; (condition-case nil
;; ;;     (init--install-packages)
;; ;;   (error
;; ;;    (package-refresh-contents)
;; ;;    (init--install-packages)))


;; ;; (load-file "~/source/java/cedet/cedet-devel-load.el")
;; ;; (add-hook 'after-init-hook (lambda ()
;; ;; time?
;; (iswitchb-mode 1) ;; obsolete my arse
;; (which-func-mode 1)

(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
  
(global-set-key [(meta left)] 'windmove-left)
(global-set-key [(meta right)] 'windmove-right)
(global-set-key [(meta up)] 'windmove-up)
(global-set-key [(meta down)] 'windmove-down)

 (require 'multiple-cursors)

;;Then you have to set up your keybindings - multiple-cursors doesn't presume to
;;know how you'd like them laid out. Here are some examples:

;;When you have an active region that spans multiple lines, the following will
;;add a cursor to each line:

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;;When you want to add multiple cursors not based on continuous lines, but based on
;; keywords in the buffer, use:

    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; (global-set-key [()] 'comment-or-uncomment-region)
;; ;; (global-set-key (kbd "C-c c") 'comment-or-uncomment-region )
;; ;; (global-set-key (kbd "C-c c") 'comment-or-uncomment-region )
;; (global-set-key (kbd "C-c c") 'comment-region )
;; (global-set-key (kbd "C-c u") 'uncomment-region )

;; ;; (load-file "~/.emacs.d/elpa/color-theme-6.6.1/color-theme.el")
;; ;;(require 'color-theme)
;; ;; (eval-after-load "color-theme"
;; ;;   '(progn
;; ;;      (color-theme-initialize)
;; ;;      (color-theme-actress)))
;; ;;(color-theme-initialize)
;; ;;(color-theme-calm-forest)

;; ;; (load-file "~/.emacs.d/elpa/color-theme-actress-0.2.2/color-theme-actress.el")
;; ;; (color-theme-actress)

;; ;; (load-file "~/.emacs.d/elpa/color-theme-gruber-darker-1/color-theme-gruber-darker.el")
;; ;; (color-theme-gruber-darker)

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(cider-lein-command "/opt/lein")
;;  '(custom-enabled-themes (quote (tango-dark)))
;;  '(display-time-mode t)
;;  '(ediff-window-setup-function (quote ediff-setup-windows-plain))
;;  '(emms-player-list nil)
;;  '(flymake-luac-program "/home/stephan/source/lua/5.1/bin/luac")
;;  '(indent-tabs-mode nil)
;;  '(inhibit-startup-screen t)
;;  '(magit-diff-show-diffstat nil)
;;  '(max-lisp-eval-depth 6000)
;;  '(max-specpdl-size 4340)
;;  '(scheme-program-name "/home/stephan/source/tinyscheme/tinyscheme-1.41/scheme")
;;  '(show-paren-mode t)
;;  '(tool-bar-mode nil))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(rainbow-delimiters-depth-1-face ((t (:foreground "grey70"))))
;;  '(rainbow-delimiters-depth-3-face ((t (:foreground "#b0b1a4")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("8dc7f4a05c53572d03f161d82158728618fb306636ddeec4cce204578432a06d" default)))
 '(describe-char-unidata-list
   (quote
    (name old-name general-category canonical-combining-class bidi-class decomposition)))
 '(lsp-keymap-prefix "C-c l")
 '(package-selected-packages
   (quote
    (feature-mode multiple-cursors windresize request protobuf-mode kubernetes rainbow-delimiters dap-mode yasnippet use-package unicode-fonts magit lsp-ui go-mode company-lsp)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "red"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "green"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "blue"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "chocolate"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "steel blue"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "deep pink")))))
(put 'narrow-to-region 'disabled nil)

