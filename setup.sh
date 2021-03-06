# I will manually installed plugins

## This part installs the nesscary software
apt update 
apt --assume-yes install vim
apt --assume-yes install neovim
# For clipboard support. Not nesscary on server
#apt --assume-yes install vim-gtk
apt --assume-yes install git
apt --assume-yes install ctags
apt --assume-yes install silversearcher-ag
apt --assume-yes install tmux
apt --assume-yes install tig
apt --assume-yes install ncdu
apt --assume-yes install tree
#apt --assume-yes upgrade python3 nvm, neovim is prebuilt with python3.6
#apt --assume-yes install python-pip # for neovim
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

#mkdir ~/.vim
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/plugged
ln -s ~/dotfiles/plug.vim ~/.vim/autoload/plug.vim
## TODO: make directory site and autoload
mkdir -p ~/.local/share/nvim/site/autoload
ln -s ~/dotfiles/plug.vim ~/.local/share/nvim/site/autoload/plug.vim
ln -s ~/dotfiles/colors ~/.vim/colors

touch ~/.vim_config

## TODO: make directoty nvim
## If neovim enabled
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/init.lua ~/.init.lua

