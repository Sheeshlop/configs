#
# ~/.bashrc
#

# If not running interactively, don't do anything
set -o vi
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias caprun='ionic capacitor run -l --external'
alias capb='ionic capocitor build --prod'
alias cda="cd ~/angular"
alias se="vim ~/.bashrc"
alias sy="source ~/.bashrc"
alias s="echo ~/.bashrc"
alias cdm="cd ~/angular/AG/cms && tmux"

alias xs="xrdb ~/.Xresources"
