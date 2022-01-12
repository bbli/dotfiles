# I will manually installed plugins
# ************  Stuff to Manually Install on Old Linux Distros  ************{{{1
# 1. fish
# 2. fzf
# 3. starship

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
ln -sf "$dotfiles_path/.vimrc" ~/.vimrc
ln -sf "$dotfiles_path/.inputrc" ~/.inputrc
## ubuntu image already has a bashrc that sources the .bash_aliases file
#ln -sf "$dotfiles_path/.bashrc" ~/.bashrc
ln -sf "$dotfiles_path/.bash_aliases" ~/.bash_aliases
ln -sf "$dotfiles_path/.gitconfig" ~/.gitconfig
ln -sf "$dotfiles_path/.shell_prompt.sh" ~/.shell_prompt.sh
ln -sf "$dotfiles_path/.tmux.conf" ~/.tmux.conf
mv ~/.config/fish/config.fish ~/.config/fish/config.fish.old
ln -sf "$dotfiles_path/config.fish" ~/.config/fish/config.fish
ln -sf "$dotfiles_path/kitty.conf" ~/.config/kitty/kitty.conf

mkdir -p ~/.vim
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/plugged
ln -sf "$dotfiles_path/plug.vim" ~/.vim/autoload/plug.vim
mkdir -p ~/.local/share/nvim/site/autoload
ln -sf "$dotfiles_path/plug.vim" ~/.local/share/nvim/site/autoload/plug.vim
ln -sf "$dotfiles_path/colors" ~/.vim/colors

#touch ~/.vim_config

### If neovim enabled
mkdir -p ~/.config/nvim
ln -sf "$dotfiles_path/init.vim" ~/.config/nvim/init.vim
ln -sf "$dotfiles_path/init.lua" ~/.init.lua
ln -sf "$dotfiles_path/emacs/config.el" ~/.doom.d/config.el
ln -sf "$dotfiles_path/emacs/init.el" ~/.doom.d/init.el
ln -sf "$dotfiles_path/emacs/packages.el" ~/.doom.d/packages.el
ln -sf "$dotfiles_path/startship.toml" ~/.config/starship.toml

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
 git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo pacman -S ctags
sudo pacman -S starship
sudo pacman -S clang
sudo pacman -S neovim
# ************  YAY SETUP  ************
cd
mkdir Software
cd Software
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si

# Finally manually install `yay`
#echo 1 | yay --noconfirm nerd-fonts-source-code-pro
yay --noconfirm --answerdiff=None nerd-fonts-source-code-pro 

# ************  PIP SOFTWARE  ************{{{1
sudp pacman -S python-pip
pip install cmake-language-server

# ************  INSTALL TREESITTER(vim command line)  ************{{{1
nvim -c ':TSInstall cmake' \
-c ':TSInstall cpp' \
-c ':TSInstall vim' \
-c ':TSInstall rust' \
-c ':TSInstall haskell' \
-c ':TSInstall fish'
-c ':qa'
