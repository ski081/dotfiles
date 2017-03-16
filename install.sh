#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR
export EXTRA_DIR

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"

# Update dotfiles itself first

# [ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# symlinks

ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

# Package managers & packages

. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/bash.sh"
# . "$DOTFILES_DIR/install/rvm.sh"

# Install extra stuff

# if [ -d "$EXTRA_DIR" -a -f "$EXTRA_DIR/install.sh" ]; then
#     . "$EXTRA_DIR/install.sh"
# fi
