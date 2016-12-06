#!/usr/bin/env bash

BASE=$(pwd)

# Get permissions
sudo -v

# Make temp file directories for vim
run "Creating Vim temporary directories..."
mkdir -pv ~/.vim/swaps ~/.vim/backups ~/.vim/undo
echo "Done."

# Make backups
echo "Backing up '.vimrc' and '.zshrc'..."
cp -nv ~/.vimrc ~/.vimrc-old
cp -nv ~/.zshrc ~/.zshrc-old
echo "Done."

Create symlinks
echo "Creating symlinks..."
ln -sf $BASE/vim/.vimrc ~/.vimrc
ln -sf $BASE/zsh/.zshrc ~/.zshrc
ln -sf $BASE/git/.gitignore_global ~/.gitignore_global
ln -sf $BASE/git/.gitconfig ~/.gitconfig
ln -sf $BASE/sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -sf $BASE/sublime/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -sf $BASE/sublime/Material-Theme.sublime-theme ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
echo "Done."
