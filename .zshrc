export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

ZSH_THEME="custom"

plugins=(git)

export EDITOR="MacVim"

# misc
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias simple="python -m SimpleHTTPServer 3000"

# git
alias ga="git add"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gpl="git pull"
alias glf="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gsp="git stash pop"
alias gcmt='git commit -m'

# vagrant
alias vgs="vagrant ssh"

# editors
alias subl="open -a 'Sublime Text'"
alias v="open -a 'MacVim'"

# dotfiles
alias df="cd ~/.dotfiles"
alias zshc="v ~/.zshrc"
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
