#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
setxkbmap -option ctrl:swapcaps

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
xsetroot -cursor_name left_ptr
xrdb -merge ~/.Xresources &
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint -0x191970 --height 12 &
pidgin &
volwheel &
gnome-power-manager &
fbxkb &
exec xmonad &> /dev/null
