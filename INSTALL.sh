#!/bin/bash

SRCDIR="src"
DESTDIR="$HOME"
WROTE_INSHELL="no"

function add_to_shellrc()
{
    if [ "$WROTE_INSHELL" == "no" ]; then
	WROTE_INSHELL="yes"
	add_to_shellrc ""
	add_to_shellrc "# ----------------------------------"
	add_to_shellrc "#           EPITECH CONFIG          "
	add_to_shellrc "# ----------------------------------"
    fi
    if [ -f "$DESTDIR/.bashrc" ]; then
	echo "$1" >> "$DESTDIR/.bashrc"
    fi
    if [ -f "$DESTDIR/.zshrc" ]; then
	echo "$1" >> "$DESTDIR/.zshrc"
    fi
}

echo "Installing {EPITECH.} Emacs configuration on your session..."
echo
echo "Checking environment variables..."
if [ -z "$USER_NICKNAME" ]; then
    echo "You need to set your nickname (eg. John Doe)"
    echo -n "> "
    read input_nickname
    add_to_shellrc "export USER_NICKNAME=\"${input_nickname}\""
    echo "Nickname saved"
else
    echo "Nickname already set."
fi
if [ -z "$USER_LOGIN" ]; then
    echo "You need to set your login (without @epitech.eu)"
    echo -n "> "
    read input_login
    add_to_shellrc "export USER_LOGIN=\"${input_login}\""
    echo "Login saved."
else
    echo "Login already set."
fi
echo
echo "Copying files..."
cat "$SRCDIR/.emacs" >> "$DESTDIR/.emacs"
mkdir -p "$DESTDIR/.emacs.d/lisp"
cp "$SRCDIR/.emacs.d/lisp/std.el" "$DESTDIR/.emacs.d/lisp/"
cp "$SRCDIR/.emacs.d/lisp/std_comment.el" "$DESTDIR/.emacs.d/lisp/"
echo
echo "Installation complete."
