# Include helper functions
source ~/.dotfiles/bin/helpers

# GO
export GOPATH=$HOME/go

# PATH
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:~/.composer/vendor/bin
export PATH=$PATH:$GOPATH/bin

# ZSH
export ZSH=$HOME/.oh-my-zsh

# NVM
export NVM_DIR="$HOME/.nvm"

# Colourize GREP output
export GREP_OPTIONS="--color=auto"
# Default editor
export EDITOR=code

# Load php-version
source $(brew --prefix php-version)/php-version.sh
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
