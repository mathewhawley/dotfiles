BASE=$(pwd)

# get permissions
sudo -v

# make backup of .vimrc
mv -v ~/.vimrc ~/.vimrc-old

# create symlink
ln -sf $BASE/.vimrc ~/.vimrc
