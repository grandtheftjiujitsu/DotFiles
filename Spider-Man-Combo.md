Spider-Man Themed Configuration Set
===================================

by grandtheftjiujitsu (GitHub / Arch Linux Forums)

--------------------------------------------------

![Picture](https://lh6.googleusercontent.com/-d46fv7uZhlU/VJcxfALM3MI/AAAAAAAAChY/xJ24HdwDIkM/w542-h305-no/2014-12-21-153917_1920x1080_scrot.png)

[Wallpaper](http://daringfireball.net/projects/markdown/syntax)

### dwm - ~/.dwm/config.h
> static const char normbordercolor[] = "#000000";

> static const char normbgcolor[]     = "#000000";

> static const char normfgcolor[]     = "#00b0d8";

> static const char selbordercolor[]  = "#000000";

> static const char selbgcolor[]      = "#ff535a";

> static const char selfgcolor[]      = "#000000";

### ~/.conkyrc
> out_to_x no

> out_to_console yes

> background no

> update_interval 0.5

> total_run_times 0

> use_spacer none

> short_units yes

> override_utf8_locale no

> temperature_unit fahrenheit

> TEXT

> ${execpi 1800 curl -s "http://weather.yahooapis.com/forecastrss?w=2375544&u=f" -o ~/.cache/weather.xml}

> ${execpi 14400 kalu -m > /tmp/Updates}

> ^fg(\#ff535a)eDWN ${downspeed enp5s0}#

>  ^fg()| ^fg(\#00b0d8)wDWN ${downspeed wlp3s0}#

>  ^fg()| ^fg(\#ff535a)RAM ${memperc}%#

>  ^fg()| ^fg(\#00b0d8)CPU ${cpu}% (${acpitemp}'F)#

>  ^fg()| ^fg(\#ff535a)Root ${fs_used /} / ${fs_size /} (${fs_used_perc /}%)#

>  ^fg()| ^fg(\#00b0d8)Home ${fs_used /home} / ${fs_size /home} (${fs_used_perc /home}%)#

>  ^fg()| ^fg(\#ff535a)${execp cmus-remote -Q | grep "tag artist" | tail -c +12} : ${execi 60 cmus-remote -Q | grep "tag title" | tail -c +11}#

>  ^fg()| ^fg(\#00b0d8)Vol ${execp cmus-remote -Q | tail -c 3}#

>  ^fg()| ^fg(\#ff535a)Bright ${execp xbacklight -get | head -c 3}#

>  ^fg()| ^fg(\#00b0d8)Batt ${battery_percent}%#

>  ^fg()| ^fg(\#5adb3c)${execp cat /tmp/Updates |grep "updates available" |head -c 20} ${execp cat /tmp/Updates |grep "AUR"}#

>  ^fg()| ${time %T} (${execi 300 grep "yweather:condition" ~/.cache/weather.xml | grep -o "temp=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"}'F)

### ~/.config/cmus/autosave
> set color_cmdline_attr=default

> set color_cmdline_bg=default

> set color_cmdline_fg=blue

> set color_cur_sel_attr=default

> set color_error=yellow

> set color_info=red

> set color_separator=blue

> set color_statusline_attr=default

> set color_statusline_bg=default

> set color_statusline_fg=gray

> set color_titleline_attr=default

> set color_titleline_bg=default

> set color_titleline_fg=lightred

> set color_win_attr=default

> set color_win_bg=default

> set color_win_cur=gray

> set color_win_cur_sel_attr=default

> set color_win_cur_sel_bg=default

> set color_win_cur_sel_fg=gray

> set color_win_dir=black

> set color_win_fg=blue

> set color_win_inactive_cur_sel_attr=default

> set color_win_inactive_cur_sel_bg=blue

> set color_win_inactive_cur_sel_fg=gray

> set color_win_inactive_sel_attr=default

> set color_win_inactive_sel_bg=blue

> set color_win_inactive_sel_fg=black

> set color_win_sel_attr=default

> set color_win_sel_bg=red

> set color_win_sel_fg=black

> set color_win_title_attr=default

> set color_win_title_bg=black

> set color_win_title_fg=lightred

### ~/Scripts/dzconky
> #### #!/bin/sh

> FG='#ffffff'

> BG='#000000'

> FONT=-misc-*-*-*-*--14-*-*-*-*-*-iso8859-1

> conky | dzen2 -e - -h '14' -w '1800' -ta r -x '300' -fg $FG -bg $BG -fn $FONT &

### ~/.zshrc
> PROMPT="%{$fg_bold[green]%}[%{$fg_bold[red]%}%m%{$fg_bold[green]%}]%{%{$fg_no_bold[blue]%}%~%{$fg_bold[green]%} %# $reset_color"

### ~/.Xresources
> *background: #000000

> *foreground: #ffffff

> ! black

> *color0: #000000

> ! bold_black

> *color8: #555555

> ! red

> *color1: #ff535a

> ! bold_red

> *color9: #ff535a

> ! green

> *color2: #5adb3c

> ! bold_green

> *color10: #5adb3c

> ! yellow

> *color3: #ffe818

> ! bold_yellow

> *color11: #ffe818

> ! blue

> *color4: #00b0d8

> ! bold_blue

> *color12: #00b0d8

> ! magenta

> *color5: #ff10a4

> ! bold_magenta

> *color13: #ff10a4

> ! cyan

> *color6: #ff9838

> ! bold_cyan

> *color14: #ff9838

> ! white

> *color7: #d4d4d4

> ! bold_white

> *color15: #ffffff

