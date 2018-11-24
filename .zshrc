# $HOME/.zshrc
TERM="rxvt-unicode"

# Settings #
############

autoload colors && colors           # fetch colors for prompt
autoload -U compinit promptinit
compinit                            # command completion
promptinit

setopt completealiases              # auto completion for aliases
setopt HIST_IGNORE_DUPS             # ignore duplicates in history
setopt correctall                   # spell check comamnds and arguments
setopt autocd                       # no "cd" required

export VISUAL="nano"
zstyle ':completop:*' menu select   # arrow key completion

# history search
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

# Prompt #
##########
PROMPT="%{$fg_bold[cyan]%}%n%{$fg_bold[white]%} @%m %{$fg_no_bold[cyan]%}%~  %{$reset_color%}%"
#RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"

# %` = short working directory
# %m = hostname
# %t = 12 hour time
		# %T = 24 hour time
# %n = username
# %# = % for user, # for root

# Colors = black (0), red (1), green (2), yellow (3), blue (4), magenta (5), cyan (6), white (7)
# %{$fg_no_bold[color]$}
# %{$fg_bold[color]$}
# %K{color[]%k = background color
# $reset_color

# Aliases #
###########

# shell convenience
alias abi="abiword"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias addgrp="sudo usermod -aG "$1" $(whoami)"
alias dwnspd="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias electrum="electrum -w $HOME/.electrum/wallets/electrum_wallet"
alias eup="sudo systemctl start dhcpcd@enp0s25; sudo web-connect-extras"
alias eq="qpaeq"
alias geth="geth --datadir $HOME/documents/vault/ethereum"
alias git-clear="git reset --hard HEAD; git clean -fdx"
alias grep="grep --color=auto"
alias ls="ls -1 --color=auto"
alias lsa="ls -a --color=auto"
alias lsl="ls -l --color=auto"
alias lsr="ls -R --color=auto"
#alias mount="sudo mount"
#alias off="sleep 1 && sudo shutdown -h now | sudo systemctl stop slim"
alias monero="monero-wallet-cli"
alias off="shutdown -h now"
alias p6="perl6"
alias pl="perl -de 0"
alias pwsafe="pwsafe -f $HOME/documents/vault/.pwsafe.dat"
alias py="python -q"
#alias reboot="sudo reboot"
alias umount="sudo umount"
alias wifi-menu="sudo wifi-menu"
alias zef="/usr/share/perl6/vendor/bin/zef"

# scripts & utilities
alias aur-pull="git clone https://aur.archlinux.org/$1.git"
alias findinfile="grep -rnw -e $1"
alias forecast="cat /tmp/forecast"
alias ipinfo="curl ipinfo.io"
alias isrun="ps -ax | grep $1"
#alias jekyll="$HOME/.gem/ruby/2.3.0/bin/jekyll"
alias jekyll-serve="bundle exec jekyll serve"
alias mtp-dwn="fusermount -u $HOME/phone"
alias mtp-list="simple-mtpfs --list-devices"
alias mtp-up="simple-mtpfs $HOME/phone"
alias pcms="sudo openconnect vpn.pathways.com"
alias printer-default="sudo lpadmin -d $*"
alias printer-list="sudo lpinfo -v"
alias printer-on="sudo systemctl start org.cups.cupsd.service"
alias printer-off="sudo systemctl stop org.cups.cupsd.service"
alias printer-status="lpstat -s"
alias pts="phoronix-test-suite"
alias pts-add="phoronix-test-suite install"
alias pts-build="phoronix-test-suite benchmark build-linux-kernel"
alias pts-gcrypt="phoronix-test-suite benchmark gcrypt"
alias pts-gzip="phoronix-test-suite benchmark compress-gzip"
alias pts-i="phoronix-test-suite interactive"
alias scan="sudo scanimage --device-name=epson2:libusb:001:007 --source='Automatic Document Feeder' --format=pdf"
alias scratch="nano $HOME/scratch.pad"
alias syserror="sudo journalctl -p 0..3 -xn"
alias sysfail="systemctl --failed"
alias updsh="source $HOME/.zshrc"
alias updx="xrdb -merge $HOME/git/dotfiles/.Xresources"
alias wttr="cat /tmp/forecast | head -n 7 | tail -n 6"
alias wup="sudo wifi-menu; sleep 20; sudo web-connect-extras"

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
alias gaddup="git remote add upstream"
alias gbdel="git branch -d"
alias gbnew="git checkout -b"
alias gbrch="git branch"
alias gcheck="git checkout"
alias gcom="git commit -a --allow-empty-message -m ''"
alias gmg="git merge"
alias gpull="git pull"
alias gpush="git push"
alias grm="git rm"
alias grmt="git remote -v"
alias gstat="git status"

# adb
alias adb-dev="adb devices"
alias adb-fb="adb fastboot devices"
alias adb-rb="adb reboot"
alias adb-rbl="adb reboot bootloader"
alias adb-rbr="adb reboot recovery"
alias adb-psh="adb push"
alias adb-wifi="adb connect 192.168.0.11:5555"
alias fb-dev="fastboot devices"
alias fb-erase"fastboot erase"
alias fb-flash-boot="fastboot flash boot"
alias fb-flash-bl="fastboot flash bootloader"
alias fb-flash-cache="fastboot flash cache"
alias fb-flash-radio="fastboot flash radio"
alias fb-flash-recovery="fastboot flash recovery"
alias fb-flash-sys="fastboot flash system"
alias fb-flash-vendor="fastboot flash vendor"
alias fb-rb="fastboot reboot"

# user executables
export PATH=$HOME/git/scripts/shell:$PATH
export PATH=$HOME/git/scripts/python:$PATH
export PATH=$HOME/git/scirpts/r:$PATH
export PATH=$HOME/git/scripts/android:$PATH
#export PATH=$HOME/.rakudobrew/bin:$PATH
kernel-prep ()
  {
  #quick prep to build android kernel
  KERNEL_DIR=$HOME/git/kernel_huawei_angler
  DEFCON=savagezen_defconfig

  cd $KERNEL_DIR
  export ARCH=arm64
  export SUBARCH=arm64
  export CROSS_COMPILE=$HOME/git/linaro-prebuilts/bin/aarch64-linux-android-
  make clean
  make mrproper
  make $DEFCON
  }

kernel-zip ()
  {
  #quick zip tool for android kernel
  KERNEL_NAME=angler-kernel-oreo-testing.zip
  KERNEL_DIR=$HOME/git/kernel_huawei_angler
  AK_DIR=$HOME/git/anykernel
  cp $KERNEL_DIR/arch/arm64/boot/Image.gz-dtb $AK_DIR/zImage-dtb
  cd $AK_DIR
  rm *.zip
  zip -r9 $KERNEL_NAME * -x README.md $KERNEL_NAME
  }

#Setting the GEM_PATH and GEM_HOME variables may not be necessary, check 'gem env' output to verify whether both variables already exist 
GEM_HOME=$(ls -t -U | ruby -e 'puts Gem.user_dir')
GEM_PATH=$GEM_HOME
export PATH=$PATH:$GEM_HOME/bin
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#export PATH=$HOME/.rakudobrew/bin:$PATH

# for aosp build
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=$PATH:$JAVA_HOME/bin
export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx6g"

# for android sdk - needs "vmname installed"
alias studio="wmname LG3D; sh $HOME/abs/android-studio/bin/studio.sh"

# for java / android studio
export _JAVA_AWT_WM_NONREPARENTING=1
