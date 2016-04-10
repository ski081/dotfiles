if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)

READLINK=$(which greadlink || which readlink)
CURRENT_SCRIPT=$BASH_SOURCE

SCRIPT_PATH=$($READLINK "$CURRENT_SCRIPT")
DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")

for DOTFILE in "$DOTFILES_DIR"/system/.{function,function_*,path,env,alias,completion,grep,prompt,nvm,rvm,git-completion.bash,custom}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE
