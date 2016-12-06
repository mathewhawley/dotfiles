#!/usr/bin/env bash

# Get permissions
sudo -v

# Load functions
source ./bin/echoes
source ./bin/helpers

callout "Running set up script"

# Handle Homebrew install/update
which brew 2>&1 > /dev/null
if [[ $? -ne 0 ]]; then
  task "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  if [[ $? -ne 0 ]]; then
    error "Unable to install Homebrew"
    exit 2
  else
    ok
  fi
else
  task "Updating Homebrew"
  brew update > /dev/null
  ok
  prompt "Upgrade outdated packages (brew upgrade)? [y|N]"
  read response
  if [[ $response =~ ^(y|yes|Y) ]]; then
    task "Upgrading Homebrew packages"
    brew upgrade
    ok
  else
    task "Skipped Homebrew package upgrade"
    ok
  fi
fi

# Set up .gitlocal
if ! [[ -f ~/.gitlocal ]]; then
  warn "It seems you don't have a '.gitlocal' set up yet"
  prompt "What is your name?"
  echo ""
  read -r name
  prompt "What is your email address?"
  echo ""
  read -r email
  task "Updating '.gitlocal'"
  git config -f ~/.gitlocal user.name "${name}"
  git config -f ~/.gitlocal user.email "${email}"
  ok
fi

# Create symlinks
task "Creating symlinks"
BASE=$(pwd)
ln -sf $BASE/zsh/.zshrc ~/.zshrc
ln -sf $BASE/git/.gitignore_global ~/.gitignore_global
ln -sf $BASE/git/.gitconfig ~/.gitconfig
ln -sf $BASE/sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -sf $BASE/sublime/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -sf $BASE/sublime/Material-Theme.sublime-theme ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ok

callout "Complete!"
