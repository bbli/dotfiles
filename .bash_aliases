
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
#Interactive options
alias ls='ls -F --color'
alias rm='rm -i'

alias df='df -h'
alias du='du -h'

alias grep='grep --color'
alias egrep='egrep --color=auto'

export EDITOR='vim'
export VISUAL='vim'

if [ -f $HOME/.shell_prompt.sh ]; then
	    . $HOME/.shell_prompt.sh
    fi
## Directory shortcuts
alias home='cd ~'
alias code='cd ~/Dropbox/Code'
alias notes='cd ~/Dropbox/Notes'
alias swap='cd /home/benson/.local/share/nvim/swap'
alias nvimp="cd /home/benson/.nvim/plugged/repos/github.com/"
alias vimp='cd /home/benson/.vim/plugged'


## Command shortcuts
alias pstree='ps axjf'
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

## Python
alias act='source activate'
alias deact='source deactivate'
alias pytest3='python3.6 -m pytest'
alias py='python3.6'
alias ptime='python -m cProfile -s cumulative'

## Tmux
alias attach='tmux a -t -2'
alias switch='tmux switch-client -t'
alias tkill='tmux kill-ses -t'
alias nv='nvim'
alias vi='vim'

## Docker
alias doc='docker run -it'

## Remote Sync
alias syncML='rsync -avHeh ssh --progress bbli@qbio-vip4.physics.ucsb.edu:~/ML_Code/ ~/Documents/Server_Code/'
