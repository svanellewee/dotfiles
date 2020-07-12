

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq my-packages '(use-package
		    magit
		    eshell
		    go-mode
		    feature-mode
		    lsp-mode
		    lsp-ui
		    package
		    windresize
		    ox-gfm		    
		    exec-path-from-shell))

(let* (package-refreshed-already)
  (dolist (current-package my-packages)
    (message "checking %s" current-package )
    (unless (package-installed-p current-package)
      (unless package-refreshed-already
	(message "package refreshing")
	(package-refresh-contents)
	(setq package-refreshed-already t))
      (package-install current-package))))


(exec-path-from-shell-initialize)
(setq exec-path-from-shell-check-startup-files nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(flymake-eslint-show-rule-name t)
 '(org-log-done t)
 '(package-archives
   (quote
    (("melpa" . "http://melpa.milkbox.net/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (flymake-eslint js2-mode feature-mode windresize ox-gfm exec-path-from-shell lsp-ui package eshell lsp-mode go-mode magit use-package)))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "SRC" :slant normal :weight normal :height 98 :width normal)))))


(global-set-key [(meta left)] 'windmove-left)
(global-set-key [(meta right)] 'windmove-right)
(global-set-key [(meta up)] 'windmove-up)
(global-set-key [(meta down)] 'windmove-down)
(global-set-key [f7] (lambda() (interactive) (find-file user-init-file)))
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region )

(setq lsp-keymap-prefix "C-c l")
(require 'lsp-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'go-mode-hook #'lsp-deferred)

(add-hook 'js2-mode-hook #'lsp-deferred)

(require 'lsp-ui)

(eval-after-load "eshell"
  '(progn
     (require 'vc-git)
     (defun eshell/get-git-branch-name()
       (interactive)
       ;; Gets branch name from `default-directory`
       (let ((refz (with-output-to-string
		     (with-current-buffer standard-output
		       (vc-git--out-ok "symbolic-ref" "HEAD")))))
	 (progn
	   (string-match "^\\(refs/heads/\\)?\\(.+\\)$" refz)
	   (match-string 2 refz))))
;;                              )
     
     (defun with-face (str &rest face-plist)
       (propertize str 'face face-plist))
     
     (defun eshell/eshell-local-prompt-function ()
       (interactive)
       (let ((header-bg "#003"))
	 (concat
	  (with-face (concat (eshell/pwd) " ") :background header-bg)
	  (with-face (format-time-string "(%Y-%m-%d %H:%M) " (current-time)) :background header-bg :foreground "#888")
	  (with-face
	   (or (ignore-errors (format "(%s)" (eshell/get-git-branch-name))) "")
	   :background header-bg)
	  (with-face "\n" :background header-bg)
	  (with-face user-login-name :foreground "blue")
	  "@"
	  (with-face "localhost" :foreground "green")
	  (if (= (user-uid) 0)
	      (with-face " #" :foreground "red")
	    " $")
	  " ")))
     
     
     (setq eshell-highlight-prompt nil)
     (setq-default eshell-prompt-function #'eshell/eshell-local-prompt-function)))

(eval-after-load "org"
  '(require 'ox-gfm nil t))

(put 'narrow-to-region 'disabled nil)
