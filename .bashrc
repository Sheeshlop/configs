#
# ~/.bashrc
#

# If not running interactively, don't do anything
set -o vi
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
