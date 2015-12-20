BASE=$(pwd)

# get permissions
sudo -v

# make backups
mv -v ~/.vimrc ~/.vimrc-old
mv -v ~/.zshrc ~/.zshrc-old

# create symlinks
ln -sf $BASE/.vimrc ~/.vimrc
ln -sf $BASE/zsh/custom.zsh-theme ~/.oh-my-zsh/themes
ln -sf $BASE/.zshrc ~/.zshrc
ln -sf $BASE/.gitignore_global ~/.gitignore_global
ln -sf $BASE/.gitconfig ~/.gitconfig
ln -sf $BASE/sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
