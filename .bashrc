#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'



#PS1='[\u@\h \W]\$ '
#\u	username
#\h	hostname to first .
#\H	full hostname
#\w	working directory short
#\W	workging directory long
#\$	$ for non-root user and # for root
#\	place around color codes to escape
#http://ezprompt.net/
#export 
#PS1="\[\e[34m\][\[\e[m\]\[\e[35m\]\u\[\e[m\]\[\e[35m\]@\[\e[m\]\[\e[35m\]\h\[\e[m\]\[\e[34m\]]\[\e[m\]\[\e[35m\]\W\[\e[m\]\[\e[34m\]\\$\[\e[m\] "
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
PS1="\[$Blue\][\[$BPurple\]\u@\h\[$Blue\]]\[$Purple\]\w \$ $Color_Off"
