#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

setxkbmap -option caps:swapescape

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec i3 
