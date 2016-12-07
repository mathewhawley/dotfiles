# Include helper functions
source ~/.dotfiles/bin/helpers

# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
# ZSH
export ZSH=$HOME/.oh-my-zsh
# NVM
export NVM_DIR="$HOME/.nvm"

# Colourize GREP output
export GREP_OPTIONS="--color=auto"
# Default editor
export EDITOR=subl

# Load oh-my-zsh
require $ZSH/oh-my-zsh.sh
# Load prompt config
require ~/.dotfiles/zsh/prompt
# Load NVM
require "$NVM_DIR/nvm.sh"
# Load fzf
require ~/.fzf.zsh
# Load aliases
require ~/.dotfiles/zsh/aliases
