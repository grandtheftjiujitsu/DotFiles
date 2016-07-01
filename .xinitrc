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

~/scripts/dzconky-main &				# dzen2 + conky main
~/scripts/dzconky-clock &				# dzen2 + conky clock
~/scripts/dzconky-music &				# dzen2 + conky music
sh ~/.fehbg &						# set wallpaper
exec /usr/bin/pulseaudio --start &			# start sound server
exec /usr/bin/pactl load-module module-equalizer-sink &	# load equalizer
exec /usr/bin/pactl load-module module-dbus-protocol &	# load equalizer
exec /usr/bin/mpd &					# music player daemon
exec dwm						# start window manager
