###########
# Aliases #
###########
# shell convenience
alias grep="grep --color=auto"
alias ls="ls -1 --color=auto"
alias lsa="ls -a --color=auto"
alias lsl="ls -la --color=auto"

# pacman
alias uninstall="sudo pacman -Rns"			# Uninstall package
alias pacloc="pacman -Qi"				# Query locally installed package and display info
alias pacrep="pacman -Ss"				# Query official repository
alias offpkgs="pacman -Qe"				# List installed official packages
alias aurpkgs="pacman -Qqm"				# List installed unofficial packages
alias testingpkgs="paclist testing"			# List packages installed from testing repo
alias lsorphans="sudo pacman -Qdt"			# List orphaned packages
alias rmorphans="sudo pacman -Rs $(pacman -Qtdq)"	# Remove orphaned packages

# utilities
alias colortest="~/Scripts/terminal-colortest.sh"
alias dvdtools="~/Scripts/dvd-tools.sh"
alias eq="qpaeq"
alias eDWN="sudo systemctl stop ufw && ssudo systemctl stop dhcpcd@enp5s0"
alias eUP="sudo systemctl start dhcpcd@enp5s0 && sudo systemctl start ufw"
alias scratch="nano ~/scratch.pad"
alias syserror="sudo journalctl -p 0..3 -xn"
alias sysfail="systemctl --failed"
alias sysinfo="~/Scripts/sysinfo.sh"
alias unzip="7z x"
alias upddwm="cd ~/.dwm && updpkgsums && makepkg -efi"
alias updzsh="source ~/.zshrc"
alias updx="xrdb -merge ~/.Xresources"
alias use_gpu="xrandr --setprovideroffloadsink nouveau Intel && xcompmgr -c | DRI_PRIME=1"
alias wDWN="sudo systemctl stop ufw && sudo systemctl stop dhcpcd@wlp3s0"
alias wUP="sudo ~/Scripts/wifi-connect.sh && sudo systemctl start ufw"
alias xcp="xclip -i"
alias xpst="xclip -o"

# transmission
alias tsmd="transmission-daemon"
alias tsmd-quit="killall transmission-daemon"
alias tsm-add="transmission-remote -a "$1""
alias tsm-start="transmission-remote -t "$1" -s"
alias tsm-pause="transmission-remote -t "$1" -S"
alias tsm-rm="transmission-remote -t "$1" -r"
alias tsm-purge="transmission-remote -t "$1" -R"
alias tsm-stat="transmission-remote -l"
alias tsm-info="transmission-remote -r "$1" -i"

# git
alias gadd="git add -A"
alias gcom="git commit -a --allow-empty-message -m ''"
alias gstat="git status"
alias gpush="git push"
alias grm="git rm"
alias gpull="git pull"

############
# Settings #
############
#CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
#export UPDATE_ZSH_DAYS=13
#DISABLE_LS_COLORS="true"
#DISABLE_AUTO_TITLE="true"
#DISABLE_CORRECTION="true"
#HIST_STAMPS="mm/dd/yyyy"		#"mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
zstyle ':completion:*' menu select	# Auto Completion Selection with Arrows

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

###########
# Options #
###########
autoload -U compinit promptinit colors
colors
promptinit
compinit

setopt autocd			# Enter dir_name without preceeding "cd" command
setopt completealiases		# Include aliases in autocompletion
setopt HIST_IGNORE_DUPS		# Ignore duplicates in command history
setopt pushdminus		# Resort to +/- for completion
setopt autopushd		# Auto add cd'd dir to "dirs -v" 
setopt pushdsilent 
setopt pushdtohome
setopt pushdignoredups		# Ignore duplicate entries in "dirs -v"
setopt CORRECT			# Spellcheck
setopt AUTO_LIST		# Used with spellcheck
setopt COMPLETE_IN_WORD		# Tab completion mid-word
setopt interactivecomments	# "%1 Killed" will show up exactly when it's killed
unsetopt flowcontrol

###############
# Keybindings #
###############
autoload ~/.zkbd
source ~/.zkbd/xfce-unknown-linux-gnu
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history
[[ -n "${key[Pause]}"	 ]]  && bindkey  "${key[Pause]}"    kill-whole-line

##########
# Prompt #
##########
PROMPT="%{$fg_bold[green]%}[%{$fg_bold[red]%}%m%{$fg_bold[green]%}]%{%{$fg_no_bold[blue]%}%~%{$fg_bold[green]%} %# $reset_color" 

# Colors:  Black, Red, Green, Yellow, Blue, Magenta, Cyan, White
# %n = username
# %m = computer's hostname truncated to first period
# %M = computer's hostname
# %l = computer's tty
# %? = return code of last-run application
# %# = prompt based on user privelegs (# for root and % for res)
# %T = system time HH:MM
# %* = system time HH:MM:SS
# %D = system date YY-MM-DD
# %d = current working directory
# %~ = current working directory with $HOME replaced by ~
# %U [...] %u = underline [] contents
# %B [...] %b = bold [] contents
# %{ [...] %} = [] contents will not be printed

##############
# Disk Track #
##############
# For use with $dirs -v
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20
