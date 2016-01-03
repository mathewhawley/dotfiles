export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

ZSH_THEME="custom"

export EDITOR="MacVim"

# general
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias simple="python -m SimpleHTTPServer 3000"

# vagrant
alias vgs="vagrant ssh"
alias vgu="vagrant up"
alias vgh="vagrant halt"

# editors
alias subl="open -a 'Sublime Text'"
alias v="open -a 'MacVim'"

# dotfiles
alias dtf="cd ~/.dotfiles"
alias omz="cd ~/.oh-my-zsh"
alias zshc="v ~/.dotfiles/.zshrc"
alias vrc="v ~/.dotfiles/.vimrc"

# node
alias ni="npm install"
alias nis="npm install --save"
alias nisd="npm install --save-dev"
alias nig="npm install -g"
alias nr="npm run"
alias ns="npm start"
alias nu="npm uninstall"

# load nvm
export NVM_DIR="/Users/Mathew/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $ZSH/oh-my-zsh.sh
