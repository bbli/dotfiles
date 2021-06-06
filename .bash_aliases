# some more ls aliases
# alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
#Interactive options
alias ls='ls -F --color'
alias rm='rm -i'

alias df='df -h'
#alias du='du -h'

alias grep='grep --color'
alias egrep='egrep --color=auto'

export EDITOR='vim'
export VISUAL='vim'

# For promptline
if [ -f $HOME/.shell_prompt.sh ]; then
	    . $HOME/.shell_prompt.sh
    fi
## Directory shortcuts
alias home='cd ~'
alias code='cd ~/Dropbox/Code'
alias dot='cd ~/Dropbox/Code/dotfiles'
alias snip='cd ~/.vim/my-snippets/UltiSnips'
alias notes='cd ~/Dropbox/Notes'
alias swap='cd /home/benson/.local/share/nvim/swap'
alias nvimp="cd /home/benson/.nvim/plugged/repos/github.com/"
alias vimp='cd /home/benson/.vim/plugged'
alias zoom='/home/benson/Software/zoom_x86_64.pkg/opt/zoom/ZoomLauncher'
alias proj='cd $(git rev-parse --git-dir)/..'


## Command shortcuts
alias ptree='ps axf'
alias ps='ps aux'
alias p3='python3'
alias du='du -sh'
alias df='df -h'
alias search='find . -print | grep'
alias tigall='tig --all'
alias rssh='rsync -avHeh ssh --progress'
alias port='ssh -N -f -L'
alias pac='sudo pacman -S'
alias yao='yaourt -S'

## Exa
alias ls='exa'
alias ll='exa --header --long'
alias tree='exa --tree'

alias j='fasd_cd -d'     # cd, same functionality as j in autojump
alias jj='fasd_cd -d -i' # cd with interactive selection

## Python
# alias act='source activate'
# alias deact='source deactivate'
alias pytest3='python3.6 -m pytest'
alias py='python3.6'
alias ptime='python -m cProfile -s cumulative'

## Tmux
alias attach='tmux a -t'
alias switch='tmux switch-client -t'
alias tkill='tmux kill-ses -t'
alias nv='~/.local/bin/neovim'
alias vi='vim'

## Docker
alias doc='docker run -it -v /home/benson/Dropbox/Code/dotfiles:/root/dotfiles'
alias skype='/opt/skype/bin/skypeforlinux'

alias nvim-server='/home/benson/Desktop/Docker_Builds/artful-neovim/nvim-server'

# z = compress, v = verbose, H = hardlinks, h = human readable
# a = archive-copies recursively and perserves timestamps

alias tb='tensorboard'

alias dgo='/home/benson/Software/distributed_systems_go/bin/go'

# source <(curl -Ss https://raw.githubusercontent.com/wfxr/forgit/master/forgit.plugin.zsh)
#Not worth b/c I lose out on ssh fzf completion -> just do **<TAB> and tmux to navigate
#source ~/Software/fzf-tab-completion/bash/fzf-bash-completion.sh
#bind -x '"\C-j": fzf_bash_completion'
#source ~/Software/fzf-obc/bin/fzf-obc.bash

#alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
