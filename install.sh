#!/bin/zsh

BASE=$(pwd)

# get permissions
sudo -v

# make temp file directories for vim
echo "Creating Vim temporary directories..."
mkdir -pv ~/.vim/swaps ~/.vim/backups ~/.vim/undo
echo "Done."

# # make backups
echo "Backing up '.vimrc' and '.zshrc'..."
cp -nv ~/.vimrc ~/.vimrc-old
cp -nv ~/.zshrc ~/.zshrc-old
echo "Done."

# create symlinks
echo "Creating symlinks..."
ln -sfv $BASE/.vimrc ~/.vimrc
ln -sfv $BASE/zsh/custom.zsh-theme ~/.oh-my-zsh/themes
ln -sfv $BASE/.zshrc ~/.zshrc
ln -sfv $BASE/.gitignore_global ~/.gitignore_global
ln -sfv $BASE/.gitconfig ~/.gitconfig
ln -sfv $BASE/sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -sfv $BASE/sublime/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -sfv $BASE/sublime/Material-Theme.sublime-theme ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
echo "Done."
