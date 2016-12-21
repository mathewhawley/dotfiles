#!/usr/bin/env bash

# Load functions
source ./bin/echoes
source ./bin/helpers

# Start timer
SECONDS=0

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
	gcc --version
	ok "Already installed."
fi

# Handle Homebrew install/update
command -v brew > /dev/null 2>&1
task "Installing Homebrew"
if [[ $? != 0 ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	if [[ $? != 0 ]]; then
		error "Unable to install Homebrew"
		exit 1
	fi
	ok "Done."
else
	ok "Already installed."
fi

# Update Homebrew
task "Updating Homebrew"
brew update --verbose
ok "Done."

# Update packages/apps
task "Updating packages/apps"
brew upgrade
ok "Done."

# Install Homebrew packages and apps
task "Installing Homebrew packages and apps"
brew bundle --verbose
ok "Done."

# Clean up outdated/cached files
task "Cleaning up Homebrew"
brew cleanup
brew cask cleanup
ok "Done."

# Install NVM
task "Checking for NVM installation"
command -v nvm > /dev/null 2>&1
if [[ $? = 0 ]]; then
	task "Installing NVM"
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
	ok "Done."
	task "Installing latest version of Node"
	nvm install node
	ok "Done."
else
	ok "Already installed."
fi

# Change shell to Homebrew ZSH
task "Change default shell to ZSH"
CURRENT_SHELL=$(dscl . -read /Users/$USER UserShell | awk '{print $2}')
if [[ "$CURRENT_SHELL" != "/usr/local/bin/zsh" ]]; then
	task "Setting newer Homebrew ZSH (/usr/local/bin/zsh) as your shell (password required)"
	sudo dscl . -change /Users/$USER UserShell $SHELL /usr/local/bin/zsh > /dev/null 2>&1
	ok "Done."
else
	ok "Already set."
fi

# Install oh-my-zsh
task "Installing oh-my-zsh"
if ! [[ -d $HOME/.oh-my-zsh ]]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	ok "Done."
else
	ok "Already installed."
fi

# Create symlinks
task "Creating config file symlinks"
ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
ln -sf $(pwd)/git/.gitignore_global ~/.gitignore_global
ln -sf $(pwd)/git/.gitconfig ~/.gitconfig
ln -sf $(pwd)/sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -sf $(pwd)/sublime/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -sf $(pwd)/sublime/Material-Theme.sublime-theme ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ok "Done."

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

# Finish
callout "Complete! (${SECONDS}s)"
