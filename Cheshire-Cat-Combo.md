Cheshire Cat Themed Configuration Set
===================================

by grandtheftjiujitsu (GitHub / Arch Linux Forums)

--------------------------------------------------

![Picture](http://postimg.org/image/gtuplh215/)

[Wallpaper](http://1ms.net/cheshire-cat-in-the-tea-steam-386706.html)

### dwm - ~/.dwm/config.h
>static const char normbordercolor[] = "#000000";

>static const char normbgcolor[]     = "#000000";

>static const char normfgcolor[]     = "#ffffff";

>static const char selbordercolor[]  = "#000000";

>static const char selbgcolor[]      = "#ff69b4";

>static const char selfgcolor[]      = "#000000";

### ~/.conkyrc
>out_to_x no

>out_to_console yes

>background no

>update_interval 0.5

>total_run_times 0

>use_spacer none

>short_units yes

>override_utf8_locale no

>TEXT

>##################################

>${execpi 1800 curl -s "http://weather.yahooapis.com/forecastrss?w=2375544&u=f" -o ~/.cache/weather.xml}

>${execpi 14400 checkupdate > /tmp/off.updates}

>${execi 7200 ~/Scripts/aur-update-check.sh}

>^fg()^fg(\#ffffff)${execp cmus-remote -Q | grep "tag artist" | tail -c +12} : ${execi 60 cmus-remote -Q | grep "tag title" | tail -c +11}#

> ^fg()| ^fg(\#ff69b4)eDWN ${downspeed enp3s0} RAM ${memperc}%#

> ^fg()| ^fg(\#ffffff)CPU ${cpu cpu1}% ${cpu cpu2}% ${cpu cpu3}% ${cpu cpu4}% ${acpitemp}'C#
 
>^fg()| ^fg(\#ff69b4)Boot ${fs_used_perc /boot}% (${fs_used /boot}) Root ${fs_used_perc /}% (${fs_used /})#
 
>^fg()| ^fg(\#ffffff)${execp cat /tmp/off.updates | wc -l} Off ${execp cat /tmp/aur.updates | wc -l} AUR Updates#
 
>^fg()| ^fg(\#ff69b4)${time %a %b %d %H:%M} (${execi 300 grep "yweather:condition" ~/.cache/weather.xml | grep -o "temp=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"}'F)

### ~/.config/cmus/autosave
>set color_cmdline_attr=default

>set color_cmdline_bg=default

>set color_cmdline_fg=white

>set color_cur_sel_attr=default

>set color_error=lightred

>set color_info=lightyellow

>set color_separator=white

>set color_statusline_attr=default

>set color_statusline_bg=default

>set color_statusline_fg=blue

>set color_titleline_attr=default

>set color_titleline_bg=default

>set color_titleline_fg=lightmagenta

>set color_win_attr=default

>set color_win_bg=default

>set color_win_cur=blue

>set color_win_cur_sel_attr=default

>set color_win_cur_sel_bg=default

>set color_win_cur_sel_fg=gray

>set color_win_dir=gray

>set color_win_fg=white

>set color_win_inactive_cur_sel_attr=default

>set color_win_inactive_cur_sel_bg=white

>set color_win_inactive_cur_sel_fg=gray

>set color_win_inactive_sel_attr=default

>set color_win_inactive_sel_bg=white

>set color_win_inactive_sel_fg=default

>set color_win_sel_attr=default

>set color_win_sel_bg=magenta

>set color_win_sel_fg=black

>set color_win_title_attr=default

>set color_win_title_bg=black

>set color_win_title_fg=lightmagenta

### ~/Scripts/dzconky
> #### #!/bin/sh

> FG='#ffffff'

> BG='#000000'

> FONT=-misc-*-*-*-*--14-*-*-*-*-*-iso8859-1

> conky | dzen2 -e - -h '14' -w '1800' -ta r -x '300' -fg $FG -bg $BG -fn $FONT &

### ~/.bashrc
>Color_Off='\e[0m'       # Text Reset

># Regular Colors

>Black='\e[0;30m'        # Black

>Red='\e[0;31m'          # Red

>Green='\e[0;32m'        # Green

>Yellow='\e[0;33m'       # Yellow

>Blue='\e[0;34m'         # Blue

>Purple='\e[0;35m'       # Purple

>Cyan='\e[0;36m'         # Cyan

>White='\e[0;37m'        # White

># Bold

>BBlack='\e[1;30m'       # Black

>BRed='\e[1;31m'         # Red

>BGreen='\e[1;32m'       # Green

>BYellow='\e[1;33m'      # Yellow

>BBlue='\e[1;34m'        # Blue

>BPurple='\e[1;35m'      # Purple

>BCyan='\e[1;36m'        # Cyan

>BWhite='\e[1;37m'       # White

> PS1="\[$Blue\][\[$BPurple\]\u\[$Blue\]@\[$BPurple\]\h\[$Blue\]]\[$Purple\]\w \$ $Color_Off"

### ~/.Xresources
>! Colors

>URxvt*background: 0

>URxvt*foreground: 15

>URxvt*colorBD: 3

>Urxvt*colorUL: 4

>URxvt*cursorColor: 13

>! black

>*color0: #000000

>! bold_black

>*color8: #555555

>! red

>*color1: #ff535a

>! bold_red

>*color9: #ff535a

>! green

>*color2: #5adb3c

>! bold_green
>*color10: #5adb3c

>! yellow

>*color3: #ffe818

>! bold_yellow

>*color11: #ffe818

>! blue

>*color4: #00b0d8

>! bold_blue

>*color12: #00b0d8

>! magenta

>*color5: #ff10a4

>! bold_magenta

>*color13: #ff10a4

>! cyan

>*color6: #ff9838

>! bold_cyan

>*color14: #ff9838

>! white

>*color7: #d4d4d4

>! bold_white

>*color15: #ffffff
