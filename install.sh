BASE=$(pwd)

# get permissions
sudo -v

# make backup of .vimrc
mv -v ~/.vimrc ~/.vimrc-old

# create symlinks
ln -sf $BASE/.vimrc ~/.vimrc
ln -sf $BASE/zsh/custom.zsh-theme ~/.oh-my-zsh/themes
