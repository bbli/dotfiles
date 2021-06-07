;;;; Doom Stuff
;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(if (eq system-type 'darwin)
  ; Mac specific things
  (progn
      (setq code-directory "~/Documents/Code")
      (setq org-directory "~/Documents/Org")
      (setq dotfiles-directory "~/dotfiles")
    )
  ; Linux specific things
  (progn
    (setq code-directory "~/Dropbox/Code/")
    (setq org-directory "~/Dropbox/Org")
      (setq dotfiles-directory "~/Dropbox/Code/dotfiles")
    )
)
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Benson Li"
      user-mail-address "bensonbinbinli@gmail.com")
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(after! doom-modeline
  (setq doom-modeline-persp-name t)
  (setq doom-modeline-height 20)
  (setq doom-modeline-buffer-encoding nil)
  )
(setq doom-font (font-spec :family "Source Code Pro" :size 22)
           doom-variable-pitch-font (font-spec :family "ETBembo" :size 28)
           ;; DejaVu headlines are too wide for my tastes
           ;; doom-variable-pitch-font (font-spec :family "DejaVu Sans" :size 28)
   )
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic))
;;;; From Elegant
;; Mode line (this might be slow because of the "☰" that requires substitution)
;; This line below makes things a bit faster
;; (set-fontset-font "fontset-default"  '(#x2600 . #x26ff)
                  ;; "Fira Code 16")
;; (defun mode-line-render (left right)
;;   (let* ((available-width (- (window-width) (length left) )))
;;     (format (format "%%s %%%ds" available-width) left right)))
;; (defun display-header ()
;;         (setq-local header-line-format
;;         '(:eval
;;         (list
;;                 (propertize "☰" 'face `(:inherit mode-line-buffer-id)
;;                                 'help-echo "Mode(s) menu"
;;                                 'mouse-face 'mode-line-highlight)
;;                 (propertize " %b " 'face `(:inherit bold))
;;                 (if (and buffer-file-name (buffer-modified-p))
;;                 (propertize "(modified)" 'face `(:inherit face-faded)))
;;                 (propertize "%4l:%2c  " 'face `(:inherit face-faded))
;;                 )
;;         ))
;; )
(defun display-header2 ()
  (interactive)
  (setq-local header-line-format '(:eval (doom-modeline-format--main)))
  )
;; (defun set-modeline-faces ()
;;         ;; Mode line at top
;;         ;; (set-face 'header-line                                 'bold)
;;         (set-face-attribute 'header-line nil
;;                             :weight 'bold
;;                         :height 40
;;                         :underline (face-foreground 'default)
;;                         :overline nil
;;                         :box t
;;                         :foreground (face-background 'default)
;;                         :background (face-background 'default))
;;         ;; (set-face 'mode-line-inactive                            'mode-line)
;; )
;; (set-modeline-faces)
;;;; Org
;; (custom-set-faces! '(org-block-begin-line :height 150))
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;;
(add-to-list 'load-path (expand-file-name "emacs/themes" dotfiles-directory))
(require 'org-variable-pitch)
(require 'olivetti)
;; (require 'elegant)

;; Below is for preset sparse tree searches
;; (setq org-agenda-custom-commands
;;       '(("f" occur-tree "FIXME")))
(defun benson/write-mode ()
  (interactive)
  (setq olivetti-body-width 0.65)
  (setq olivetti-minimum-body-width 100)
  (display-line-numbers-mode 0)
  (olivetti-mode 1)
  ;; (doom-modeline-mode 0)
  ;; (display-header2)
  (org-variable-pitch-minor-mode)
)
(add-hook 'org-mode-hook 'benson/write-mode)
(add-hook 'org-mode-hook (lambda () (flyspell-mode 0)));since I just need this for blogging.TODO: though should just lazy load
;; (setq org-indirect-buffer-display 'new-frame) "Hmm, cannot get multiple indirect buffers w/o creating a new frame.
;; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-opera)
;; NOTE: JUST LOAD ALL ORG STUFF DURING CONFIG UNLIKE OTHER PACKAGES
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-ellipsis " ▼")
;; (setq org-startup-folded t)
(setq org-hide-emphasis-markers t)
 ;; org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿"))
(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE")))
(add-hook 'before-save-hook 'time-stamp)
;; (add-hook 'org-mode-hook 'variable-pitch-mode)
(setq org-hide-block-startup t)
(setq org-noter-notes-search-path '(,org-directory))
(setq org-startup-with-inline-images t)
(setq org-refile-targets '((nil :maxlevel . 1)
                                (org-agenda-files :maxlevel . 1)))
;; TODO: call restart?? But already seems to work
(use-package! org-superstar
            :config (org-superstar-configure-like-org-bullets)
            )
(advice-add 'org-set-tags-command :override 'counsel-org-tag)
;; (defface benson/emphasis-box-face
;;   '((t (:weight semi-bold :box t)))
;;   "Font for boxing/emphasis in notes"
;;   )
(after! org
        ;; (add-to-list 'org-font-lock-extra-keywords '("^" benson/emphasis-box-face))
        (add-to-list 'org-emphasis-alist '("_" (:inherit org-code :height 1.4)))
        (add-to-list 'org-emphasis-alist '("=" (:inherit org-verbatim :height 0.7 :box nil)))
        (push '(tags-tree . local) org-show-context-detail)
)
(custom-set-faces! '(org-tag :height 0.6))
(custom-set-faces! '(org-block :height 0.7))
(custom-set-faces! '(org-meta-line :height 0.7))
(custom-set-faces! '(org-block-begin-line :height 0.7))
(custom-set-faces! '(org-block-end-line :height 0.7))
(custom-set-faces! '(org-code :height 0.7))
(after! org
  (setq org-agenda-files '(,(expand-file-name "Learning/Learning.org" org-directory)
                            ,(expand-file-name "Software/Software.org" org-directory)
                            ,(expand-file-name "Life/Life.org" org-directory)
                          )
        )
  )
;This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; "Hmm, describe-face says height is still unspecified
;; (set-face-attribute 'mode-line nil :height 15)
(defun add-pretty-symbols-org ()
  (mapcar (lambda (cons-cell) (add-to-list 'prettify-symbols-alist cons-cell))
          '(
            ;; ("lambda" . 955)
            ("[ ]" .  "☐")
            ("[X]" . "☑" )
            ("[-]" . "❍" )
        ("#+BEGIN_SRC" . "λ")
        ("#+END_SRC" . "λ")
        ("#+begin_src" . "λ")
        ("#+end_src" . "λ")
        ("#+results:" . "»")
        ;; ("#+name:"          . "-")
            )
        )
)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(add-hook 'prog-mode-hook 'prettify-symbols-mode)
;; (add-hook 'prog-mode-hook (lambda () (doom-modeline-mode 1)))
;; NOTE: mode call needs to be added to list first -> so it can be "later" in the list
(add-hook 'org-mode-hook 'prettify-symbols-mode)
(add-hook 'org-mode-hook 'org-toggle-pretty-entities)
(add-hook 'org-mode-hook 'add-pretty-symbols-org)

(setq projectile-project-search-path `(code-directory org-directory))

;;;; TODO Misc
; NOTE: It appears maps are loaded after doom remaps,
; as I can map to r, which is replace in evil mode
(map! :leader :n "e f" 'edebug-defun)
(map! :leader :n "e F" `eval-defun)
(map! :leader :n "j j" 'ace-link)
(map! :leader :n "t n" 'treemacs)
; TODO add properly to doom leader search map
(map! :leader "s b" 'counsel-grep)
(map! :leader "s s" 'counsel-grep)
(map! :map emacs-lisp-mode-map
      :ni "C-c C-c" #'eval-last-sexp)

;; Ofc this doesn't work. Body needs to be a function, not a statement...
;; (map! :nie "C-e" (progn
;;                    (evil-write)
;;       (evil-force-normal-state)
;;                    )
;;       )
(defun benson/go-normal ()
  (interactive)
    (evil-write)
    (evil-normal-state)
  )
(map! :nie "C-e" 'evil-force-normal-state)
; TODO why doesn't this wokr?
;(map! :nive "C-e" 'benson/go-normal)
(keyboard-translate ?\C-c ?\C-e)
(keyboard-translate ?\C-e ?\C-c)

;;;; Semi-Colon Maps
;; (define-prefix-command 'evil-semicolon-map)
(defun benson/insert-semicolon ()
  (interactive)
  (insert ";")
  )
(map! :i "; ;" 'benson/insert-semicolon)
(map! :niv "; c" 'evil-normal-state)
(defun benson/write-file ()
  (interactive)
  (evil-force-normal-state)
  (save-buffer)
  )
(map! :niv "; w" 'benson/write-file)
(map! :niv "; q" (progn
        'evil-quit
        'evil-normal-state
        )
)
(map! :niv "; d" 'kill-this-buffer)
(map! :niv "; n" 'projectile-next-project-buffer)
(map! :niv "; N" 'projectile-previous-project-buffer)

;;;; TODO Keymaps to Remember
;;;; <C-M-m> to set multiple tags
;;;; TODO Find Maps
; TODO Need to do this emacs style -> since "%" is always interpreted as format string
;; (message www)
;; (defun benson/find-and-replace-at-point ()
  ;; (interactive)
  ;; (let ((www "\\s/"))
        ;; (evil-ex-d)
  ;; )
(map! :leader
      "f" nil
      (:prefix "f"
       ;; :desc "Find in current directory" "a" #'+default/find-file-under-here
       ;; :desc "Find in git repo" "f" #'+ivy/projectile-find-file
       ;;  3. find current word in entire repo -> and send to quickfix
       ;;  4. Find and replace in this buffer
       ;;  :desc "Search tags in current buffer" -> find tag instead?
       ;;  :desc "Search headline in current buffer" -> find headlines
       :desc "Find word under cursor and replace" "r" #'benson/find-and-replace-at-point
       )
)
;(map! :map evil-motion-state-map
;;       :desc "swiper fuzzy search buffer" "/" #'+default/search-buffer)
(map! :leader
      :desc "swiper fuzzy search buffer" "/" #'+default/search-buffer)

;;;; TODO Toggle Operations
;1. Treemacs
;;;; TODO Code Related Operations
;1. Format

;;;; Buffer Related Operations
(map! :leader
      "b" nil
      (:prefix "b"
        :desc "switch to alternate file"           "s" #'evil-switch-to-windows-last-buffer
        :desc "maximize buffer"           "m" #'doom/window-maximize-buffer
        :desc "open project buffer" "b" #'+ivy/switch-workspace-buffer
        :desc "open all buffers" "B" #'ivy-switch-buffer
        :desc "kill current buffer" "k" #'kill-this-buffer
        :desc "choose a buffer to delete" "d" #'ido-kill-buffer
        :desc "cycle outshine mode" "c" #'outshine-cycle-buffer
        )
)
;;;; Window Relation Operations
;; ;;<C-w> M = recenter
;; ;(map! maximize buffer -> window)


;;;; Workspace Related Operations
(map! :map doom-leader-workspace-map
      :desc "new workspace" "c" #'+workspace/new
      :desc "delete workspace" "k" #'+workspace/delete
      :desc "rename workspaces" "r" #'+workspace/rename
      :desc "next workspace" "n" #'+workspace/switch-right
      :desc "next workspace" "p" #'+workspace/switch-left
      :desc "switch to last workspace" "m" #'+workspace/other
      :desc "display workspaces" "w" #'+workspace/display
      )
(map! :leader
      "w" nil
      :desc "workspace" "w" 'doom-leader-workspace-map
)
(map! "C-q" 'doom-leader-workspace-map)


;;;; Git Related Operationss
(map! :leader
      :prefix "g"
      :desc "next hunk" "n" #'git-gutter:next-hunk
      :desc "next hunk" "p" #'git-gutter:previous-hunk
)

;;;; Move related operations
(map! :i "C-l" #'right-char)
(map! :i "C-h" #'evil-delete-backward-char-and-join)
;; Make this position dependent based on major mode?
(map! :n "C-l" #'sp-next-sexp)
(map! :n "C-h" #'sp-previous-sexp)
;;;; Insert Related Operations(Map to C-i)
(dolist (k '("C-i" "C-m"))
  (define-key input-decode-map (kbd k) (kbd (concat "<" k ">"))))
;; (global-set-key (kbd "<C-i>") #'yas-insert-snippet)
(define-prefix-command 'benson/insert-map)
(global-set-key (kbd "<C-i>") 'benson/insert-map)
;(add-to-list 'emulation-mode-map-alists )
;; (define-key benson/insert-map "s" #'yas-insert-snippet)
(defun benson/insert-connect-pair ()
  (interactive)
  (insert-char ?= 2)
  )
(defun benson/insert-emphasis-pair ()
  (interactive)
  (insert-char ?_ 2)
  )
(defun benson/insert-file-path ()
  (interactive)
  (+default/insert-file-path t)
  )
(map! :map benson/insert-map
      :desc "insert snippets" "s" #'yas-insert-snippet
      :desc "current file name" "f" #'benson/insert-file-path
      ;:desc "ideally also any file path" "F"
      :desc "insert date" "d" #'org-time-stamp-inactive
      :desc "insert connect red" "c" #'benson/insert-connect-pair
      :desc "insert emphasis" "b" #'benson/insert-emphasis-pair
  )
;;;; TODO Buffer/Org Relation Operations
;; 1. buffer open makes more sense than note open(which is open the notes directory "b o" and open everything "b O"
;; 2. yeah, and buffer close to vs note capture "b c"
;; 5. buffer tag
;; 8. org up headline
;; From https://emacs.stackexchange.com/questions/30504/how-to-fold-all-org-blocks-under-the-current-header-line
(defun benson/org-hide-block-subtree ()
  "Hide blocks only below current heading."
  (interactive)
  (save-restriction
    (widen)
    (org-narrow-to-subtree)
    (org-hide-block-all)))
(map! :map org-mode-map
      ;; :desc "open branches below subtree" "C-c o" (lambda () (interactive) (outline-show-children 10))
      :desc "open branches below subtree" "C-c o" #'org-show-subtree
      :desc "open ALL branches up to level two" "C-c O" #'(lambda () (interactive) (org-content 2))
      :desc "close current branch" "C-c c" #'outline-hide-body

      :desc "next visible heading" "C-c C-n" #'outline-next-visible-heading
      :desc "previous visible heading" "C-c C-p" #'outline-previous-visible-heading
      :desc "go up a heading" "C-c C-u" #'outline-up-heading
      :desc "toggle narrow of subtree" "C-c n" #'org-toggle-narrow-to-subtree
      :desc "hide source blocks of current subtree" "C-c h" #'benson/org-hide-block-subtree
      ;; :desc "hide source blocks of current subtree" "C-c c"
      ;; #'flyspell-correct-at-point

      ;; :desc "find tag" "C-c C-u" #'outline-up-heading
      :desc "refile headline" "C-c r" #'org-refile
      :desc "ediff two regions" "C-c e" #'ediff-regions-linewise
      )
(map! :leader :desc "remove babel result for current block" "m r" #'org-babel-remove-result)
;; 4. next headline "b n"(leave at C-e C-n since it's a motion)

;;;; TODO Jump Maps
;; Hmm, how about next source block? Put on jump?
(map! :leader
      :prefix "j"
      :desc "jump to definition" "d" #'+lookup/definition
      :desc "jump to definition" "c" #'goto-last-change
      :desc "jump to next error" "e" #'next-error
      :desc "jump to next error" "E" #'previous-error
      )

;;;; TODO To be decided Maps
;; Q: maybe make minor mode movements to C-m instead of SPC m
;; Project Related Operations
;; open project scratch buffer "p s"

;; Note Related actions
;(map! :leader
      ;:prefix "n"
      ;:desc "org store link" "n l"
      ;:desc "Run find file in note directory" "n o"
      ;:desc "Run find word in note directory" "n f"
      ;:desc "Org capture" "n c"
      ;:desc "Org agenda"
      ;)

;(map! :leader
      ;:prefix "s"
      ;:desc "search buffer" "y" #'counsel-yank-pop
      ;:desc "search current directory" "y" #'counsel-yank-pop
      ;:desc "jump to bookmark" "y" #'counsel-yank-pop
      ;:desc "search project" "y" #'counsel-yank-pop
      ;:desc "search dictionary" "y" #'counsel-yank-pop
;)

;;;; Open Related Operations
(defun benson/open-org-directory ()
  (interactive)
(counsel-fzf nil org-directory nil)
  )
(map! :leader
      "o" nil
      (:prefix "o"
      :desc "search yank history" "y" #'counsel-yank-pop
      ;; :desc "search bookmarks" "b" #'counsel-bookmark
      :desc "open recent files" "h" #'counsel-recentf
      :desc "open repl split" "r" #'+eval/open-repl-other-window
      :desc "open repl inside" "R" #'+eval/open-repl-same-window
      :desc "open current project files" "p" #'+ivy/projectile-find-file
      :desc "open Org directory" "o" #'benson/open-org-directory
      :desc "open scratch buffer" "s" 'doom/switch-to-scratch-buffer
      :desc "open config directory" "c" #'doom/find-file-in-private-config
      :desc "open all buffers" "b" #'ivy-switch-buffer
      :desc "choose a buffer to delete" "d" #'ido-kill-buffer
       )
)

(after! magit
        (setf (alist-get 'unpushed magit-section-initial-visibility-alist) 'show)
)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(define-key key-translation-map (kbd "M-;") (kbd "M-x"))
; Emacs Specific Options set not line wrapping, should probably remove this
;; (add-hook 'text-mode-hook #'auto-fill-mode)
;; From Jethro's blod who says that otherwise Doom will force line breaks
;; (remove-hook 'text-mode-hook #'auto-fill-mode)
;; (add-hook 'message-mode-hook #'word-wrap-mode)
;(custom-set-faces!
  ;'(outline-1 :weight extra-bold :height 1.0)
  ;'(outline-2 :weight bold :height 1.35)
  ;'(outline-3 :weight bold :height 1.15)
  ;'(outline-4 :weight semi-bold :height 1.05)
  ;'(outline-5 :weight semi-bold :height 1.0)
;)
;; This makes headings white, which I don't want given I will be in a light background.
;; Otherwise the way it sets the heights is pretty good
;; (let* ((variable-tuple (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
;;                                  ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
;;                                  ((x-list-fonts "Verdana")         '(:font "Verdana"))
;;                                  ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
;;                                  (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
;;            (base-font-color     (face-foreground 'default nil 'default))
;;            (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

;;       (custom-theme-set-faces 'user
;;                               `(org-level-8 ((t (,@headline ,@variable-tuple))))
;;                               `(org-level-7 ((t (,@headline ,@variable-tuple))))
;;                               `(org-level-6 ((t (,@headline ,@variable-tuple))))
;;                               `(org-level-5 ((t (,@headline ,@variable-tuple))))
;;                               `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
;;                               `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
;;                               `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
;;                               `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
;;                               `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))
;;         )
;; )

;;;; General Settings
(setq display-line-numbers-type 'relative)
(setq +zen-text-scale 1.2)
(global-visual-line-mode t)
(require 'vimrc-mode)
(add-to-list 'auto-mode-alist '("\\.vim\\(rc\\)?\\'" . vimrc-mode))

;; NOTE: Hmm, so what's the point of after! if this file(config.el) loads after all other files have loaded
;; NOTE: OHH, cause some packages are only loaded once you enter the file
;; WT: maybe b/c company is loaded already, whereas other packages are lazily loaded
;; In fact, code below only works without after wrap
(setq company-idle-delay 0.1)
(setq which-key-idle-delay 0.6)
(setq company-tooltip-idle-delay 0.2)
;; (setq company-show-numbers t)

;; (defvar outline-minor-mode-prefix "\M-#")
(advice-add 'outshine-mode :after 'outshine-cycle-buffer)
;; (add-hook 'emacs-lisp-mode-hook 'outshine-mode)

(setq split-height-threshold nil)
(setq split-width-threshold 0)

(setq org-image-actual-width nil)
(setq debugger-stack-frame-as-list t)
;; maybe define advising function to ensure value is what we want?
(setq split-width-threshold nil)
; Note this will only show up in terminal emacs
(defface fallback '((t :family "Fira Code"))  "Display")
(set-display-table-slot standard-display-table 'wrap
                        (make-glyph-code ?↩ 'fallback))
;; (setq search-invisible nil); no point given I can't expand just the sparse tree results as of now
;; (advice-add 'evil-narrow-to-field :overwrite "dummy macro)
(advice-add 'ediff-quit :after (lambda (&rest stuff)(winner-undo)))
;; (use-package eaf
;;   ;; :load-path "/usr/share/emacs/site-lisp/eaf"
;;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
;;   :init
;;   (use-package epc) ;:defer t :ensure t)
;;   (use-package ctable); :defer t :ensure t)
;;   (use-package deferred); :defer t :ensure t)
;;   (use-package s); :defer t :ensure t)
;;   ;; :custom
;;   ;; (eaf-browser-continue-where-left-off t)
;;   :config
;;   (eaf-setq eaf-browser-enable-adblocker "true")
;;   (eaf-bind-key scroll_up "k" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_down "j" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key take_photo "p" eaf-camera-keybinding)
;;   (eaf-bind-key copy_link "y" eaf-browser-keybinding)
;;   (eaf-bind-key insert_or_scroll_up_page "C-u" eaf-browser-keybinding)
;;   (eaf-bind-key nil "v" eaf-browser-keybinding)
;;   (eaf-bind-key insert_or_open_browser "O" eaf-browser-keybinding)
;;   (eaf-bind-key insert_or_edit_url "o" eaf-browser-keybinding)
;;   (eaf-bind-key nil "C-w" eaf-browser-keybinding)
;;   ;; (eaf-bind-key nil "M-q" eaf-browser-keybinding)
;;   ) ;; unbind, see more in the Wiki
;; (require 'eaf-evil)

;; (define-key key-translation-map (kbd "SPC")
;;     (lambda (prompt)
;;       (if (derived-mode-p 'eaf-mode)
;;           (pcase eaf--buffer-app-name
;;             ("browser" (if  (string= (eaf-call-sync "call_function" eaf--buffer-id "is_focus") "True")
;;                            (kbd "SPC")
;;                          (kbd eaf-evil-leader-key)))
;;             ("pdf-viewer" (kbd eaf-evil-leader-key))
;;             ("image-viewer" (kbd eaf-evil-leader-key))
;;             (_  (kbd "SPC")))
;;         (kbd "SPC"))))
(setq ox-hugo-export-with-toc t)
(use-package ox-hugo
  :ensure t            ;Auto-install the package from Melpa (optional)
  :after ox
  ;; (ox-hugo-export-with-section-numbers 't)
  ;; (ox-hugo-footer "hi")
  )
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
;; (setq org-log-done 'time)
;; (setq org-log-done-with-time nil)
(setq enable-local-variables 't)
(setq global-auto-revert-mode 't)
