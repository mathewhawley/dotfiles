# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to on-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Colourize GREP output
export GREP_OPTIONS="--color=auto"

# Default editor
export EDITOR=subl

# Set ZSH theme
ZSH_THEME="custom"

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load CLI aliases
source ~/.dotfiles/zsh/aliases
