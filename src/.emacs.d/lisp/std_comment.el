;;
;; EPITECH PROJECT, 2017
;; emacs configuration
;; File description:
;; standard epitech header configuration
;;

(global-set-key	"" 'std-file-header)

(setq header-epitech		"EPITECH PROJECT, "
      header-description	"File description:")

(setq std-c-alist               '( (cs . "/*") (cc . "** ") (ce . "*/") )
      std-css-alist             '( (cs . "/*") (cc . "** ") (ce . "*/") )
      std-cpp-alist             '( (cs . "/*") (cc . "** ") (ce . "*/") )
      std-pov-alist             '( (cs . "//") (cc . "// ") (ce . "//") )
      std-java-alist            '( (cs . "//") (cc . "// ") (ce . "//") )
      std-latex-alist           '( (cs . "%%") (cc . "%% ") (ce . "%%") )
      std-lisp-alist            '( (cs . ";;") (cc . ";; ") (ce . ";;") )
      std-xdefault-alist        '( (cs . "!!") (cc . "!! ") (ce . "!!") )
      std-pascal-alist          '( (cs . "{ ") (cc . "   ") (ce . "}" ) )
      std-makefile-alist        '( (cs . "##") (cc . "## ") (ce . "##") )
      std-text-alist            '( (cs . "##") (cc . "## ") (ce . "##") )
      std-fundamental-alist     '( (cs . "  ") (cc . "   ") (ce . "  ") )
      std-html-alist            '( (cs . "<!--") (cc . "  -- ") (ce . "-->"))
      std-php-alist		'( (cs . "#!/usr/local/bin/php\n<?php") (cc . "// ")(ce . "//"))
      std-nroff-alist           '( (cs . "\\\"") (cc . "\\\" ") (ce . "\\\""))
      std-sscript-alist         '( (cs . "#!/bin/sh")  (cc . "## ") (ce . "##"))
      std-perl-alist            '( (cs . "#!/usr/local/bin/perl -w")  (cc . "## ")(ce . "##"))
      std-cperl-alist           '( (cs . "#!/usr/local/bin/perl -w")  (cc . "## ")(ce . "##"))
      )


(setq std-modes-alist '(("C"                    . std-c-alist)
			("C/l"                  . std-c-alist)
                        ("CSS"                  . std-c-alist)
                        ("PoV"                  . std-pov-alist)
                        ("C++"                  . std-cpp-alist)
                        ("C++/l"                . std-cpp-alist)
                        ("Lisp"                 . std-lisp-alist)
                        ("Lisp Interaction"     . std-lisp-alist)
                        ("Emacs-Lisp"           . std-lisp-alist)
                        ("Fundamental"          . std-fundamental-alist)
                        ("Shell-script"         . std-sscript-alist)
                        ("Makefile"             . std-makefile-alist)
                        ("BSDmakefile"          . std-makefile-alist)
                        ("GNUmakefile"          . std-makefile-alist)
                        ("Perl"                 . std-cperl-alist)
                        ("CPerl"                . std-cperl-alist)
                        ("xdefault"             . std-xdefault-alist)
                        ("java"                 . std-java-alist)
                        ("latex"                . std-latex-alist)
                        ("Pascal"               . stdp-ascal-alist)
                        ("Text"                 . std-text-alist)
                        ("HTML"                 . std-html-alist)
			("PHP"                 . std-php-alist)
                        ("Nroff"                . std-nroff-alist)
                        ("TeX"                  . std-latex-alist)
                        ("LaTeX"                . std-latex-alist))
      )

(defun std-get (a)
  (interactive)
  (cdr (assoc a (eval (cdr (assoc mode-name std-modes-alist)))))
  )

(defun std-file-header ()
  "Puts a standard header at the beginning of the file.\n(According to mode)"
  (interactive)
  (goto-char (point-min))
  (let ((projname "toto")(projdescription "tiuti"))
    (setq projname (read-from-minibuffer
		    (format "Type project name (RETURN to quit) : ")))
    (setq projdescription (read-from-minibuffer
		    (format "Type short file description (RETURN to quit) : ")))

    (insert (std-get 'cs))
    (newline)
    (insert (concat (std-get 'cc)
			   header-epitech
			   (format-time-string "%Y")))
    (newline)
    (insert (concat (std-get 'cc)
			   projname))
    (newline)
    (insert (concat (std-get 'cc)
			   header-description))
    (newline)
    (insert (concat (std-get 'cc)
			   projdescription))
    (newline)
    (insert (std-get 'ce))
    (newline)
    (newline)))

;;;; Generating local keymaps for exotics modes.

;;; In CPerl mode, C-c C-h is used to do some help.
;;; so it is C-c C-h h
;;; For working, it requires info pages about perl
(add-hook 'cperl-mode-hook
	  '(lambda ()
	     (define-key cperl-mode-map ""
	       'comment-region)
	     (define-key cperl-mode-map "h"
	       'std-file-header)))

;; for perl-mode
(add-hook 'perl-mode-hook
	  '(lambda ()
	     (define-key perl-mode-map ""
	       'comment-region)))

;; for all kind of lisp code
(add-hook 'emacs-lisp-mode-hook
 	  '(lambda ()
 	     (define-key emacs-lisp-mode-map  ""
 	       'comment-region)))

(add-hook 'lisp-mode-hook
 	  '(lambda ()
 	     (define-key lisp-mode-map  ""
 	       'comment-region)))



;; for La(TeX)-mode
(add-hook 'tex-mode-hook
	  '(lambda ()
	     (define-key tex-mode-map ""
	       'comment-region)))

