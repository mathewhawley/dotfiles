#!/usr/bin/env bash

# Load functions
source ./bin/echoes
source ./bin/helpers

# Start timer
SECONDS=0;

# Begin script
callout "Environment configuration"

# Check for Xcode
task "Checking for Xcode installation"
xcode-select -p > /dev/null 2>&1
if [[ $? != 0 ]];  then
  warn "You don't seem to have Xcode installed. Please install this before continuing"
  error "Xcode not installed."
  exit 1
else
  ok
fi

# Handle Homebrew install/update
command -v brew > /dev/null 2>&1
if [[ $? != 0 ]]; then
  task "Installing Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  if [[ $? != 0 ]]; then
    error "Unable to install Homebrew"
    exit 1
  fi
  ok
fi

# Install Homebrew packages and apps
task "Installing Homebrew packages and apps"
brew bundle --verbose
ok

# Clean up outdated/cached files
task "Cleaning up Homebrew"
brew cleanup
brew cask cleanup
ok

# Install NVM
task "Checking for NVM installation"
command -v nvm > /dev/null 2>&1
if [[ $? = 0 ]]; then
  task "Installing NVM"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
  ok
  task "Installing latest version of Node"
  nvm install node
  ok
else
  ok
fi

# Set up .gitlocal
task "Checking for '.gitlocal'"
if ! [[ -f ~/.gitlocal ]]; then
  warn "It seems you don't have a '.gitlocal' set up yet"
  prompt "Would you like to create a new '.gitlocal'? [y|N]"
  read response
  if [[ $response =~ ^(y|yes|Y) ]]; then
    update_git_local
  fi
else
  prompt "Would you like to edit your existing '.gitlocal'? [y|N]"
  read response
  if [[ $response =~ ^(y|yes|Y) ]]; then
    echo ""
    cat ~/.gitlocal
    echo ""
    update_git_local
  fi
fi

# Create symlinks
task "Creating config file symlinks"
ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
ln -sf $(pwd)/git/.gitignore_global ~/.gitignore_global
ln -sf $(pwd)/git/.gitconfig ~/.gitconfig
ln -sf $(pwd)/sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -sf $(pwd)/sublime/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -sf $(pwd)/sublime/Material-Theme.sublime-theme ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ok

# Change shell to Homebrew ZSH
task "Checking login shell is set to ZSH"
CURRENT_SHELL=$(dscl . -read /Users/$USER UserShell | awk '{print $2}')
if [[ "$CURRENT_SHELL" != "/usr/local/bin/zsh" ]]; then
  task "Setting newer Homebrew ZSH (/usr/local/bin/zsh) as your shell (password required)"
  sudo dscl . -change /Users/$USER UserShell $SHELL /usr/local/bin/zsh > /dev/null 2>&1
fi
ok

# Finish
callout "Complete! (${SECONDS}s)"
