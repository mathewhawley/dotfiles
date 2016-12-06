# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to on-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Colourize GREP output
export GREP_OPTIONS="--color=auto"

# Default editor
export EDITOR=subl

# Set NVM directory
export NVM_DIR="$HOME/.nvm"

# Load NVM
if [[ -f "$NVM_DIR/nvm.sh" ]]; then
  . "$NVM_DIR/nvm.sh"
fi

# Load fzf
if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
fi

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load CLI aliases
source ~/.dotfiles/zsh/aliases

# Load prompt config
source ~/.dotfiles/zsh/prompt
