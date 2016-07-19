export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export GREP_OPTIONS="--color=auto"
export EDITOR="subl"
ZSH_THEME="custom"

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $ZSH/oh-my-zsh.sh

# general
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias simple="python -m SimpleHTTPServer 3000"
alias h="history"
alias ngk="ngrok http"
alias showFiles="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder"
alias hideFiles="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder"

#applications
alias firefox="open -a firefox"
alias safari="open -a safari"
alias chrome="open -a google\ chrome"
alias f="open -a Finder"
alias sketch="open -a Sketch"
alias canary="open -a google\ chrome\ canary"
alias opera="open -a opera"
alias sim="open -a Simulator"

# git
alias gco="git checkout"
alias gcob="git checkout -b"
alias gb="git branch"
alias gbr="git branch --remote"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gd="git diff"
alias gds="git diff --staged"
alias gf="git fetch"
alias gpl="git pull"
alias gl="git log"
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glo="git log --oneline --decorate --color"
alias gp="git push"
alias gr="git remote"
alias gs="git status"
alias gst="git stash"
alias gstp="git stash pop"

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
alias zshc="subl ~/.dotfiles/.zshrc"
alias vrc="subl ~/.dotfiles/.vimrc"

# node
alias ni="npm install"
alias nis="npm install --save"
alias nisd="npm install --save-dev"
alias nig="npm install -g"
alias nr="npm run"
alias ns="npm start"
alias nu="npm uninstall"

