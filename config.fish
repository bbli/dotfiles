# Command Aliases
function j
    fasd_cd -d $argv
end

function rm
    /usr/bin/rm -i $argv
end

function jj
    fasd_cd -d -i 
end

function df
    /usr/bin/df -h $argv
end

function du
    /usr/bin/du -h $argv
end

function nv
    /home/benson/.local/bin/neovim $argv
end

function vi
    vim $argv
end

function psf
    procs --tree | fzf
end

function ptree
    procs --tree
end

function pac
    sudo pacman -S $argv
end

function yao
    yaourt -S $argv
end

### Exa
function ls
    exa $argv
end

function ll
    exa --header --long -H -m $argv
end

function tree
    exa --tree $argv
end

### Python
function act
    source activate $argv
end

function deact
    source deactivate $argv
end

function py
    python3 $argv
end

# directories
function code
    cd ~/Dropbox/Code
end

function dot
    cd ~/Dropbox/Code/dotfiles
end

function notes
    cd ~/Dropbox/Notes
end

function rdb
    cgdb -d rust-gdb
end

function proj
    cd (git rev-parse --git-dir)/..
end

function snip
    cd ~/.vim/my-snippets/UltiSnips
end

function dgo
    /home/benson/Software/distributed_systems_go/bin/go $argv
end
# Variables
set SPACEFISH_PROMPT_ADD_NEWLINE false
set SPACEFISH_PROMPT_SEPARATE_LINE true
set SPACEFISH_DIR_COLOR cyan
set SPACEFISH_PACKAGE_SHOW false
set SPACEFISH_RUST_SHOW false
set SPACEFISH_GOLANG_SHOW false

source /opt/miniconda3/etc/fish/conf.d/conda.fish

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/benson/Software/cloud-sdk-stuff/google-cloud-sdk/path.fish.inc' ]; . '/home/benson/Software/cloud-sdk-stuff/google-cloud-sdk/path.fish.inc'; end
