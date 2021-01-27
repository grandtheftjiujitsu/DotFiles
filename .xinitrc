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

exec /usr/bin/pulseaudio --start &			# start sound server
exec /usr/bin/pactl load-module module-equalizer-sink &	# load equalizer
#exec /usr/bin/pactl load-module module-dbus-protocol &	# load equalizer, fails to load
exec /usr/bin/redshift -l 33.7515:-84.7477 &		# bluelight blocker
exec /usr/bin/sh $HOME/scripts/shell/cache-tmpfs &	# mount .cache to tmpfs

exec startxfce4						# start desktop environment

# WM Edition
#$HOME/.conky/dzconky-main &				# dzen2 + conky main
#$HOME/.conky/dzconky-clock &				# dzen2 + conky clock
#$HOME/.conky/dzconky-music &				# dzen2 + conky music
#sh $HOME/.fehbg &					# set wallpaper
#exec dwm						# start window manager
