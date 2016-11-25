export ZSH=$HOME/.oh-my-zsh
export PATH="$HOME/.yarn/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export GREP_OPTIONS="--color=auto"
export EDITOR="subl"

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# set ZSH theme
ZSH_THEME="custom"

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# load cli aliases
source ~/.dotfiles/zsh/alias
