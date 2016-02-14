#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &	# merge Xresources

exec ~/.fehbg &							# loads background image
~/scripts/dzconky &						# start conky + dzen
exec /usr/bin/dwm						# start window manager
#exec pulseaudio --start &					# start pulseaudio (done in dwm)
#exec pactl load-module module-equalizer-sink &
#exec pactl load-module module-dbus-protocol &
