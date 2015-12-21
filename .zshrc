export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

ZSH_THEME="custom"

plugins=(git)

export EDITOR="MacVim"

# misc
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
alias zshc="v ~/.dotfiles/.zshrc"
alias omz="v ~/.oh-my-zsh"
alias vrc="v ~/.dotfiles/.vimrc"

# node
alias ni="npm install"
alias nis="npm install --save"
alias nisd="npm install --save-dev"
alias nig="npm install -g"
alias nr="npm run"
alias ns="npm start"

source $ZSH/oh-my-zsh.sh
