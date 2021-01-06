exec /usr/bin/pulseaudio --start &			# start sound server
exec /usr/bin/pactl load-module module-equalizer-sink &	# load equalizer
exec /usr/bin/pactl load-module module-dbus-protocol &	# load equalizer
exec /usr/bin/sh $HOME/tovgamonitor &			# close laptop display, send X to minotor

exec /usr/bin/startxfce4
