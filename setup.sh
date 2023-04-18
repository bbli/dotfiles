## Fail on first error
# ************  Bash Behavior Configuration  ************ %%%1
set -e
exit_on_error() {
    exit_code=$1
    last_command=${@:2}
    if [ $exit_code -ne 0 ]; then
        >&2 echo "\"${last_command}\" command failed with exit code ${exit_code}."
        exit $exit_code
    fi
}
# enable !! command completion
set -o history -o histexpand
# Example Usage
# ls --fake-option
# exit_on_error $? !!
# ************  Stuff to Manually Install on Old Linux Distros  ************ %%%1
# 1. fish
# 2. fzf
# 3. rust
    # - starship
    # - exa

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
#git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim


dotfiles_path=$HOME/Dropbox/Code/dotfiles
#dotfiles_path=$HOME/dotfiles
# This script will mostly just set up symbolic links
ln -sf "$dotfiles_path/.vimrc" $HOME/.vimrc
ln -sf "$dotfiles_path/.init.vim" $HOME/.config/nvim/init.vim
ln -sf "$dotfiles_path/.inputrc" $HOME/.inputrc
## ubuntu image already has a bashrc that sources the .bash_aliases file
#ln -sf "$dotfiles_path/.bashrc" $HOME/.bashrc
ln -sf "$dotfiles_path/.bash_aliases" $HOME/.bash_aliases
ln -sf "$dotfiles_path/.gitconfig" $HOME/.gitconfig
ln -sf "$dotfiles_path/.shell_prompt.sh" $HOME/.shell_prompt.sh
ln -sf "$dotfiles_path/.tmux.conf" $HOME/.tmux.conf
mkdir -p $HOME/.config/fish
mkdir -p $HOME/.config/kitty
# mv $HOME/.config/fish/config.fish $HOME/.config/fish/config.fish.old
ln -sf "$dotfiles_path/config.fish" $HOME/.config/fish/config.fish
ln -sf "$dotfiles_path/kitty.conf" $HOME/.config/kitty/kitty.conf

mkdir -p $HOME/.vim
mkdir -p $HOME/.vim/autoload
mkdir -p $HOME/.vim/plugged
ln -sf "$dotfiles_path/plug.vim" $HOME/.vim/autoload/plug.vim
mkdir -p $HOME/.local/share/nvim/site/autoload
ln -sf "$dotfiles_path/plug.vim" $HOME/.local/share/nvim/site/autoload/plug.vim
ln -sf "$dotfiles_path/colors" $HOME/.vim/colors

#touch $HOME/.vim_config

### If neovim enabled
## MANUALLY DO THIS AS WE MAY ACCIDENTLY WIPE CONFIG DIRECTORY
# ln -sf "$dotfiles_path/nvim" $HOME/.config/
mkdir -p $HOME/.doom.d
ln -sf "$dotfiles_path/emacs/config.el" $HOME/.doom.d/config.el
ln -sf "$dotfiles_path/emacs/init.el" $HOME/.doom.d/init.el
ln -sf "$dotfiles_path/emacs/packages.el" $HOME/.doom.d/packages.el
ln -sf "$dotfiles_path/starship.toml" $HOME/.config/starship.toml

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
 git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
sudo pacman -S ctags
# sudo pacman -S starship
# sudo pacman -S clang
# sudo pacman -S neovim
# ************  YAY SETUP  ************
# cd
# mkdir Software
# cd Software
# git clone https://aur.archlinux.org/yay-git.git --depth 1
# cd yay-git
# makepkg -si

# Finally manually install `yay`
#echo 1 | yay --noconfirm nerd-fonts-source-code-pro
# yay --noconfirm --answerdiff=None nerd-fonts-source-code-pro 

# ************  PIP SOFTWARE  ************ %%%1
sudo pacman -S python-pip
pip install cmake-language-server

# ************  INSTALL TREESITTER(vim command line)  ************ %%%1
nvim -c ':TSInstall cmake' \
-c ':TSInstall cpp' \
-c ':TSInstall vim' \
-c ':TSInstall rust' \
-c ':TSInstall haskell' \
-c ':TSInstall fish'
-c ':qa'
