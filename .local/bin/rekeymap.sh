#!/bin/sh

# script for config keymaps for xserver
xset r rate 300 50
setxkbmap -layout us
setxkbmap -option ctrl:nocaps
killall xcape 2>/dev/null ; xcape -e 'Control_L=Escape'


