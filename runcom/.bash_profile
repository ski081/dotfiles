#!/bin/bash


if [ -f ~/.bashrc ]; then
    # shellcheck source=/dev/null
    source ~/.bashrc
fi

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)

READLINK=$(which greadlink || which readlink)
CURRENT_SCRIPT=$BASH_SOURCE

SCRIPT_PATH=$($READLINK "$CURRENT_SCRIPT")
DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")

for DOTFILE in "$DOTFILES_DIR"/system/.{function,function_*,path,env,alias,completion,grep,nvm,git-completion.bash,custom}; do
    # shellcheck source=/dev/null
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

# Bootstrap powerline prompt
function _update_ps1() {
    PS1="$(powerline-shell $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Load RBENV
eval "$(rbenv init -)"

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE
