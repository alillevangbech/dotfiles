#!/bin/sh

# script for config keymaps for xserver
xset r rate 300 50
setxkbmap -layout dk
setxkbmap -option caps:super
killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'
