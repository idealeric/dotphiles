# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TMPDIR=/tmp

# If we're in x, use a nicer prompt.
if [[ -n "$DISPLAY" ]]; then
  ZSH_THEME="robbyrussell"
	DEFAULT_USER="eric"
	xseticon -id "$WINDOWID" /home/eric/.terminal.png
  alias v="nvim"
  alias vim="nvim"
else
	ZSH_THEME="flazz"
	alias v='nvim -c "colorscheme default"'
	alias vim='nvim -c "colorscheme default"'
fi

alias sudo='sudo '
alias m='make'
alias e='exit'
alias lsa='ls -lA'
alias top='htop'
alias fucking='sudo'
alias sp='sudo pacman'
alias spu='sudo pacman -Syu && cd /tmp && cower -u'

alias shootest='~/Code/shoobx.app/bin/test -pvc --all -t'
alias shoorender='~/Code/shoobx.app/bin/sbt2pdf'
alias shoohome='cd ~/Code/shoobx.app/'

# turn off <c-s> locking my shit
stty -ixon

zstyle :omz:plugins:ssh-agent identities id_shoobx

# add noop to vim cmd mode
noop() { }
zle -N noop
bindkey -M vicmd '\e' noop
plugins=(git git-extras vi-mode ssh-agent)

source $ZSH/oh-my-zsh.sh

alias gcop='gco -p'
alias gap='ga -p'
alias glog='tig'
alias gcf='gc --fixup'
alias gcaf='gca --fixup'

# User configuration
HISTSIZE=1600
SAVEHIST=1500
HISTFILE=~/.zhistory
DIRSTACKSIZE=20

# Don't expand files matching:
fignore=(.o .bu .old .pro .class .pyc .min.js .min.css .map)

export EDITOR=nvim
export PS_PERSONALITY='linux'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

man() {
    env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@"
}

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Systemd shortcuts:
start() {
	sudo systemctl start $1.service
}
restart() {
	sudo systemctl restart $1.service
}
stop() {
	sudo systemctl stop $1.service
}
permenable() {
	sudo systemctl enable $1.service
}
status() {
	sudo systemctl status $1.service
}
permdisable() {
	sudo systemctl disable $1.service
}

toilet -f pagga --gay Shoobx
shoohome
