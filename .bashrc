#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###########
# Options #
###########
shopt -s cdspell	# helps avoice spelling errors
shopt -s checkwinsize	# check window size / text wrapping after each command
shopt -s autocd		# autocd

bind '"\e[A": history-search-backward'	# history scroll w/ up key
bind '"\e[B": history-search-forward'	# history scorll w/ down key

# ~/.inputrc - for ctrl+left and ctrl+right word movement

##########
# Prompt #
##########

#PS1='[\u@\h \W]\$ '
#\u	username
#\h	hostname to first .
#\H	full hostname
#\w	working directory short
#\W	workging directory long
#\$	$ for non-root user and # for root
#\	place around color codes to escape

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

PS1="\\[$Blue\][\[$BPurple\]\u\[$Blue\]@\[$BPurple\]\h\[$Blue\]]\[$Purple\]\w \$ \[$Color_Off\]"

###########
# Aliases #
###########

# shell convenience
alias grep="grep --color=auto"
alias ls="ls -1 --color=auto"
alias lsa="ls -a --color=auto"
alias lsl="ls -l --color=auto"
alias lsr="ls -R --color=auto"
alias py="python -q"
alias py2="/usr/bin/python2.7"
alias isrun="ps -ax | grep $1"

# pacman
alias pacloc="pacman -Qi"				# Query locally installed package and display info
alias pacrep="pacman -Ss"				# Query official repository
alias offpkgs="pacman -Qe"				# List installed official packages
alias aurpkgs="pacman -Qqm"				# List installed unofficial packages
alias testingpkgs="paclist testing"			# List packages installed from testing repo
alias lsorphans="sudo pacman -Qdt"			# List orphaned packages
alias rmorphans="sudo pacman -Rs $(pacman -Qtdq)"	# Remove orphaned packages
alias exppkgs="pacman -Qet"				# Explicitly installed and not dependencies
alias pkgowner="pacman -Qo "$1""			# Which package owns input file / library

# utilities
alias addgrp="sudo usermod -aG "$1" $(whoami)"
alias audio-ana="pacmd set-card-profile alsa_card.pci-0000_01_00.1 output:analog-stereo"
alias audio-dig="pacmd set-card-profile alsa_card.pci-0000_01_00.1 output:hdmi-stereo-extra1"
alias changegov="sudo zsh ~/scripts/changegov.sh"
alias changeio="sudo zsh ~/scripts/changeio.sh"
alias colortest="~/scripts/terminal-colortest.sh"
alias dvdtools="~/scripts/dvd-tools.sh"
alias dwnspd="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias eq="qpaeq"
alias eDWN="sudo systemctl stop ufw && sudo pkill dhcpcd"
alias eUP="sudo systemctl start dhcpcd@enp3s0 && sudo systemctl start ufw"
alias icanhazip="curl icanhazip.com"
alias scratch="nano ~/scratch.pad"
alias ssdbu="sudo ~/scripts/backups/ssd_backup.sh"
alias syserror="sudo journalctl -p 0..3 -xn"
alias sysfail="systemctl --failed"
alias sysinfo="~/scripts/sysinfo.sh"
alias ungpg="zsh ~/scripts/ungpg.sh"
alias unzip="7z x"
alias upddwm="cd ~/.dwm && updpkgsums && makepkg -efi && cp ~/.dwm/config.h ~/git/Configs/.dwm/"
alias updsh="source ~/.bashrc && cp ~/.bashrc ~/git/Configs/"
alias updx="xrdb -merge ~/.Xresources && cp ~/.Xresources ~/git/Configs/"
alias vbox="sudo modprobe vboxdrv && virtualbox"
alias winxp="sudo modprobe vboxdrv && virtualbox --startvm Windows\ XP"
gpgzip () {
  tar -cf - $* | gzip -9 - | gpg -c -o $*.tar.gz.gpg && rm -rf $*
}
targzip () {
  tar -cf - $* | gzip -9 - > $*.tar.gz
}
tarxzip () {
  tar -cf - $* | xz -9 - > $*.tar.xz
}
#alias hdmioff="xrandr --output HDMI1 --off --output LVDS1 --auto && amixer set IEC958 mute"
#alias hdmion="xrandr --output LVDS1 --off --output HDMI1 --auto && amixer set IEC958 unmute"
#alias use_gpu="xrandr --setprovideroffloadsink nouveau Intel && xcompmgr -c | DRI_PRIME=1"
#alias wDWN="sudo pkill netctl && sudo systemctl stop dhcpcd && sudo ip link set wlp3s0 down"
#alias wUP="sudo wifi-menu -o && sudo systemctl start ufw"

# transmission
alias tsm="transmission-remote -l"
alias tsmd="transmission-daemon"
alias tsmd-kill="killall transmission-daemon"
alias tsm-add="transmission-remote -a $*"
alias tsm-start="transmission-remote -t "$1" -s"
alias tsm-pause="transmission-remote -t "$1" -S"
alias tsm-rm="transmission-remote -t "$1" -r"
alias tsm-purge="transmission-remote -t "$1" -R"
alias tsm-info="transmission-remote -r -t "$1" -i"

# git
alias gadd="git add -A"
alias gbdel="git branch -d"
alias gbrch="git branch"
alias gcheck="git checkout"
alias gnewb="git checkout -b"
alias gcom="git commit -a --allow-empty-message -m ''"
alias gmg="git merge"
alias gpull="git pull"
alias gpush="git push"
alias grm="git rm"
alias gstat="git status"
