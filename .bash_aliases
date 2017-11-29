
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
alias home='cd ~/Documents/'
alias code='cd ~/Documents/Code'
alias notes='cd ~/Documents/Notes'
alias swap='cd /home/benson/.local/share/nvim/swap'
alias nvimp="cd /home/benson/.nvim/plugged/repos/github.com/"
alias vimp='cd /home/benson/.vim/plugged'


## Command shortcuts
alias pstree='ps axjf'
alias ps='ps aux'
alias p3='python3'
alias du='du -sh'
alias df='df -h'
alias sE='find . -print | grep'
alias tigall='tig --all'
alias rsync='rsync -avHe ssh'
alias port='ssh -N -f -L'
alias install='sudo pacman -S'

## Python
alias act='source activate'
alias deact='source deactivate'
alias pytest3='python3.6 -m pytest'
alias py='python3.6'
alias ptime='python -m cProfile -s cumulative'

## Tmux
alias attach='tmux a -t'
alias switch='tmux switch-client -t'
alias tkill='tmux kill-ses -t'
alias nv='nvim'
alias vi='vim'
