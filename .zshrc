# ~/.zshrc

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

zstyle ':completop:*' menu select   # arrow key completion

# history search
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

# Prompt #
##########
PROMPT="%{$fg_bold[green]%}%n%{$fg_bold[white]%} @%m %{$fg_no_bold[green]%}%~  %{$reset_color%}%"
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

# shell convenience & utilities
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias addgrp="sudo usermod -aG "$1" $(whoami)"
alias backup="sudo ~/scripts/backups/netbook-bk.sh"
alias changegov="~/scripts/changegov.sh"
alias changeio="~/scripts/changeio.sh"
alias colortest="~/scripts/colortest.sh"
alias dwnspd="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias getip="curl icanhazip.com"
alias grep="grep --color=auto"
alias isrun="ps -ax | grep $1"
alias jekyll="~/.gem/ruby/2.2.0/bin/jekyll"
alias ls="ls -1 --color=auto"
alias lsa="ls -a --color=auto"
alias lsl="ls -l --color=auto"
alias lsr="ls -R --color=auto"
alias mtp-dwn="fusermount -u ~/phone"
alias mtp-list="simple-mtpfs --list-devices"
alias mtp-up="simple-mtpfs ~/phone"
alias p6="perl6"
alias pl="perl -de 0"
alias pts="phoronix-test-suite"
alias pts-i="phoronix-test-suite interactive"
alias py="python -q"
alias reboot="sudo reboot"
alias scratch="nano ~/scratch.pad"
alias shutdown="sudo shutdown -h now"
alias syserror="sudo journalctl -p 0..3 -xn"
alias sysfail="systemctl --failed"
alias sysinfo="~/scripts/sysinfo.sh"
alias upddwm="cd ~/abs/dwm-git; makepkg -efi --skipchecksums"
alias vault-lock="cd ~/; tar -czvf vault.tar.gz vault; gpg -c -o vault.tar.gz.gpg vault.tar.gz; rm -rf vault vault.tar.gz"
alias vault-unlock="cd ~/; gpg --output vault.tar.gz --decrypt vault.tar.gz.gpg; tar -xvf vault.tar.gz; rm vault.tar.gz vault.tar.gz.gpg"
alias updsh="source ~/.zshrc"
alias updx="xrdb -merge ~/git/dotfiles/.Xresources"
alias wup="sudo wifi-menu; sudo ~/scripts/iptables.rules; systemctl --user start syncthing"

gpgzip () {
  tar -cf - $* | gzip -9 - | gpg -c -o $*.tar.gz.gpg && rm -rf $*
}

ungpgzip () {
  gpg --output $*.tar.gz --decrypt $*.tar.gz.gpg ; tar -xvf $*.tar.gz ; rm -rf $*{.tar.gz,.tar.gz.gpg}
}

targzip () {
  tar -cf - $* | gzip -9 - > $*.tar.gz
}

tarxzip () {
  tar -cf - $* | xz -9 - > $*.tar.xz
}

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
