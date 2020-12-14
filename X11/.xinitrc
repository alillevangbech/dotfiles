xrdb -merge ~/.Xresources
# setxkbmap -layout ~/.local/share/personal.map
./dotfiles/.local/bin/rekeymap.sh
exec /usr/bin/xmonad
