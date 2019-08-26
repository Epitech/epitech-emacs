;;
;; EPITECH PROJECT, 2018
;; epitech-emacs
;; File description:
;; global emacs configuration
;;

(set-variable 'c-argdecl-indent   0)

(normal-erase-is-backspace-mode 0)

; Define keyboard shortcuts
(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key (kbd "C-c C-c") 'compile)
(global-set-key (kbd "C-g") 'goto-line)

; Adjust indentation settings
(setq c-default-style "linux"
      c-basic-offset 4
      tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
(setq-default indent-tabs-mode nil)
