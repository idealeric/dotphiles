# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TMPDIR=/tmp

ZSH_THEME='dieter'
alias v='nvim'
alias vim='nvim'

alias sudo='sudo '
alias m='make'
alias e='exit'
alias lsa='ls -lA'
alias top='htop'
alias fucking='sudo'
alias sp='sudo pacman'
alias spu='sudo pacman -Syu && cd /tmp && cower -u'

# turn off <c-s> locking my shit
stty -ixon

# add noop to vim cmd mode
noop() { }
zle -N noop
bindkey -M vicmd '\e' noop
plugins=(git git-extras vi-mode)

source $ZSH/oh-my-zsh.sh

alias gcop='gco -p'
alias gap='ga -p'
alias glog='tig'

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
