#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

setxkbmap -option caps:escape

xset r rate 200 32 

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec i3 
i3-msg gaps inner all set 20
