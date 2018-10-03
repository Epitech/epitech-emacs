#!/bin/bash
##
## EPITECH PROJECT, 2018
## epitech-emacs
## File description:
## emacs configurations installer
##

function usage {
  echo "USAGE: $0 [local|system]"
  echo
  echo "Official Emacs configuration for Epitech students."
  echo -e "\tlocal:\tlocal installation"
  echo -e "\tsystem:\tsystem-wide installation"
  exit 0
}

function copy_files {

    if [ -d "$1/epitech" ]
    then
        echo "Cleaning old directory..."
        rm -r "$1/epitech"
    fi
    
  echo "Copying files..."
  mkdir -p "$1"

  cp -r "src/epitech" "$1/epitech"

  mkdir -p "$1/site-start.d"
  cp "src/site-start.d/epitech-init.el" "$1/site-start.d"

  cp "LICENSE" "$1/epitech/LICENSE"
}

function local_install {
  echo "Installing Emacs configuration locally..."

  copy_files "$HOME/.emacs.d/lisp"

  if [ ! -f "$HOME/.emacs" ] ||
         [ `grep -c "^;; Epitech configuration" "$HOME/.emacs"` == 0 ]
  then
      echo "Updating init file..."
      cat >> "$HOME/.emacs" <<EOF
;;    
;; Epitech configuration
;;
(add-to-list 'load-path "~/.emacs.d/lisp")
(load "site-start.d/epitech-init.el")
EOF
  else
      echo "Init file already fixed, skipping updating."
  fi
  
  echo "Done."
}

function system_install {
  echo "Installing Emacs configuration system-wide..."

  copy_files "/usr/share/emacs/site-lisp"

  echo "Done."
}

case "$1" in
  local )
    local_install
  ;;
  system )
    system_install
  ;;
  * )
    usage
  ;;
esac
