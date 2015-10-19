cd ~

mkdir .vimbackup

ln -s dotfiles/.vimrc .

ln -s dotfiles/.vim .

ln -s dotfiles/.tmux .

ln -s dotfiles/.tmux.conf .

cd path/to/dotfiles

git submodule init

git submodule update
