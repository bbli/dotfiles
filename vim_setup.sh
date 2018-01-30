# I will manually installed plugins

## This part installs the nesscary software
apt update 
apt --assume-yes install vim
# For clipboard support. Not nesscary on server
#apt --assume-yes install vim-gtk
apt --assume-yes install git
apt --assume-yes install ctags
apt --assume-yes install silversearcher-ag
apt --assume-yes install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm



# This script will mostly just set up symbolic links
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.inputrc ~/.inputrc
# ubuntu image already has a bashrc that sources the .bash_aliases file
# ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.shell_prompt.sh ~/.shell_prompt.sh
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

## If neovim enabled
#ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim

