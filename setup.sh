# I will manually installed plugins

## This part installs the nesscary software
#apt update 
#apt --assume-yes install vim
#apt --assume-yes install neovim
## For clipboard support. Not nesscary on server
##apt --assume-yes install vim-gtk
#apt --assume-yes install git
#apt --assume-yes install ctags
#apt --assume-yes install silversearcher-ag
#apt --assume-yes install tmux
#apt --assume-yes install tig
#apt --assume-yes install ncdu
#apt --assume-yes install tree
##apt --assume-yes upgrade python3 nvm, neovim is prebuilt with python3.6
##apt --assume-yes install python-pip # for neovim
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim


dotfiles_path=$HOME/Dropbox/Code/dotfiles
#dotfiles_path=$HOME/dotfiles
# This script will mostly just set up symbolic links
ln -s "$dotfiles_path/.vimrc" ~/.vimrc
ln -s "$dotfiles_path/.inputrc" ~/.inputrc
## ubuntu image already has a bashrc that sources the .bash_aliases file
#ln -s "$dotfiles_path/.bashrc" ~/.bashrc
ln -s "$dotfiles_path/.bash_aliases" ~/.bash_aliases
ln -s "$dotfiles_path/.gitconfig" ~/.gitconfig
ln -s "$dotfiles_path/.shell_prompt.sh" ~/.shell_prompt.sh
ln -s "$dotfiles_path/.tmux.conf" ~/.tmux.conf
ln -s "$dotfiles_path/config.fish" ~/.config/fish/config.fish
ln -s "$dotfiles_path/kitty.conf" ~/.config/kitty/kitty.conf

mkdir -p ~/.vim
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/plugged
ln -s "$dotfiles_path/plug.vim" ~/.vim/autoload/plug.vim
mkdir -p ~/.local/share/nvim/site/autoload
ln -s "$dotfiles_path/plug.vim" ~/.local/share/nvim/site/autoload/plug.vim
ln -s "$dotfiles_path/colors" ~/.vim/colors

#touch ~/.vim_config

### If neovim enabled
mkdir -p ~/.config/nvim
ln -s "$dotfiles_path/init.vim" ~/.config/nvim/init.vim
ln -s "$dotfiles_path/init.lua" ~/.init.lua
ln -s "$dotfiles_path/emacs/config.el" ~/.doom.d/config.el
ln -s "$dotfiles_path/emacs/init.el" ~/.doom.d/init.el
ln -s "$dotfiles_path/emacs/packages.el" ~/.doom.d/packages.el

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
 git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Finally manually install `yay` and `uctags`
