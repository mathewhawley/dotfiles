# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to on-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Colourize GREP output
export GREP_OPTIONS="--color=auto"

# Default editor
export EDITOR=subl

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load CLI aliases
source ~/.dotfiles/zsh/aliases

# Load prompt config
source ~/.dotfiles/zsh/prompt
