Wicked Themed Configuration Set
====================================

-------------------------------------

![screenshot](https://drive.google.com/uc?export=view&id=0B2RH_BSaD6YPUjU1SUFTRzhub1E)

[Wallpaper](http://im01.thewallpapers.org/desktop/65644/oz-the-great-and-powerful-wallpaper)

### dwm colors
static const char normbordercolor[] = "#3aab20";
static const char normbgcolor[]     = "#3aab20";
static const char normfgcolor[]     = "#000000";
static const char selbordercolor[]  = "#000000";
static const char selbgcolor[]      = "#000000";
static const char selfgcolor[]      = "#3aab20";

### dzen / conky colors
BG='#000000'
FG='green'
FONT=-misc-*-*-*-*--14-*-*-*-*-*-iso8859-1

### ~/.zshrc
PROMPT="%{$fg_bold[green]%}%n%{$fg_bold[yellow]%} @%m %{$fg_no_bold[green]%}%~  %{$reset_color%}%"

### ~/.Xresources

! Native Transparency
URxvt*transparent: true
URxvt*shading: 70
!  0 to 99 darkens, 101 to 200 lightens

URxvt*background: 0
URxvt*foreground: 15
URxvt*colorBD: 3
Urxvt*colorUL: 4
URxvt*cursorColor: 2

! Black
*color0:            #6e6e6e
*color8:            #6e6e6e
! Red
*color1:            #ab203a
*color9:            #ab203a
! Green
*color2:            #3aab20
*color10:           #3aab20
! Yellow
*color3:            #ab9120
*color11:           #ab9120
! Blue
*color4:            #203aab
*color12:           #203aab
! Magenta
*color5:            #9120ab
*color13:           #9120ab
! Cyan
*color6:            #66a3af
*color14:           #66a3af
! White
*color7:            #ffffff
*color15:           #ffffff