/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222"; /* norm border color */
static const char col_gray2[]       = "#444444"; /* norm bg color */
static const char col_gray3[]       = "#bbbbbb"; /* norm fg color */
static const char col_gray4[]       = "#eeeeee"; /* sel fg color */
static const char col_cyan[]        = "#005577"; /* sel bg color */
static const char *colors[][3]      = {
	/* fg        bg         border   */
	{ col_gray3, col_gray1, col_gray2}, /* normal */
	{ col_gray4, col_cyan,  col_cyan }, /* selected */
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/zsh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "urxvt", NULL };

/* custom commands */
static const char *abiword[]  = { "abiword", NULL };
static const char *brt[]      = { "xbacklight", "-inc", "10", NULL };
/*static const char *chrome[]   = { "chromium --single-process", NULL };*/
static const char *chrome[]   = { "chromium", NULL };
/*static const char *cmus[]     = { "urxvt", "-e", "cmus", NULL };*/
static const char *cmusnxt[]  = { "cmus-remote", "-n", NULL };
static const char *cmusply[]  = { "cmus-remote", "-u", NULL };
static const char *cmusprv[]  = { "cmus-remote", "-r", NULL };
static const char *dim[]      = { "xbacklight", "-dec", "10", NULL };
static const char *bluefish[] = { "bluefish", NULL };
/*static const char *libreofc[] = { "libreoffice", NULL };*/
static const char *logout[]   = { "killall", "dwm", NULL };
/*static const char *mnext[]    = { "mpc", "next", NULL };*/
/*static const char *mprev[]    = { "mpc", "prev", NULL };*/
/*static const char *mtoggle[]  = { "mpc", "toggle", NULL };*/
static const char *prtsc[]    = { "scrot", "'%Y-%m-%d-%H%M%S.jpg'", "-e", "'mv $f ~/pictures/screens_desktop/'", NULL };
static const char *reboot[]   = { "sudo", "reboot", NULL };
static const char *scrnlck[]  = { "sflock", "-f", "10x20", NULL };
static const char *shutdown[] = { "sleep", "1", "&&", "sudo", "shutdown", "now", "|", "sudo", "systemctl", "stop", "slim", NULL };
static const char *suspend[]  = { "systemctl", "suspend", NULL };
static const char *voldwn[]   = { "amixer", "sset", "Master", "10%-", NULL };
static const char *volmute[]  = { "amixer", "sset", "Master", "toggle", NULL };
static const char *volup[]    = { "amixer", "sset", "Master", "10%+", NULL };
/*static const char *wifi[]     = { "sudo", "wifi-menu", NULL };*/

//	Tag Cycling From //
//	ap0calypse.agitatio.org/articles/2012/08/17/cycle-through-your-tags-in-dwm.html //
static void x_nexttag(const Arg *arg);
static void x_prevtag(const Arg *arg);
static void x_adjtag(int n);
static void x_prevtag(const Arg *arg) {
     (void)arg;
     x_adjtag(-1);
 }
 
 static void x_nexttag(const Arg *arg) {
     (void)arg;
     x_adjtag(+1);
 }
 
 static void x_adjtag(int n) {
     {
         int i, curtags;
         int seltag = 0;
         Arg arg;
 
         /*
          *     * Check first tag currently selected.  If there are
          *         * several tags selected we only pick first one.
          *             */
         if (selmon != NULL) {
             curtags = (selmon->tagset[selmon->seltags] & TAGMASK);
         } else {
             return;
         }
         for (i = 0; i < LENGTH(tags); i++) {
             if ((curtags & (1 << i)) != 0) {
                 seltag = i;
                 break;
             }
         }
 
         /*
          *      * Calculate next selected tag wrapping around
          *           * when tag overflows.
          *                */
         seltag = (seltag + n) % (int)LENGTH(tags);
         if (seltag < 0)
             seltag += LENGTH(tags);
 
         arg.ui = (1 << seltag);
         view(&arg);
     }
 }

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_Left,   focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Right,  focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_v,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_h,      incnmaster,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_Left,   setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,             XK_Right,  setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_minus,  setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_equal,  setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_Delete,      quit,           {0} },
	
  /* custom keys */
	{ MODKEY,             XK_a,         spawn,     {.v = abiword} },
	{ MODKEY,             XK_c,         spawn,     {.v = chrome} },
	{ MODKEY,             XK_g,         spawn,     {.v = bluefish} },
/*	{ MODKEY,             XK_l,         spawn,     {.v = libreofc} },*/
	{ MODKEY,             XK_Print,     spawn,     {.v = prtsc} },
	{ MODKEY|ControlMask, XK_Delete,    spawn,     {.v = logout} },
	{ MODKEY|ControlMask, XK_Return,    spawn,     {.v = suspend} },
	{ MODKEY|ControlMask, XK_Return,    spawn,     {.v = scrnlck} },
	{ MODKEY|ControlMask, XK_space,     spawn,     {.v = reboot} },
	{ MODKEY|ControlMask, XK_BackSpace, spawn,     {.v = shutdown} },
/*	{ MODKEY|ControlMask, XK_Down,      spawn,     {.v = mtoggle} },*/
/*	{ MODKEY|ControlMask, XK_Right,     spawn,     {.v = mnext} },*/
/*	{ MODKEY|ControlMask, XK_Left,      spawn,     {.v = mprev} },*/
	{ MODKEY,             XK_Up,        x_nexttag, {0} },
	{ MODKEY,             XK_Down,      x_prevtag, {0} },
	{ MODKEY,             XK_F8,        spawn,     {.v = dim} },
	{ MODKEY,             XK_F9,        spawn,     {.v = brt} },
        { MODKEY,             XK_F10,       spawn,     {.v = cmusprv} },
        { MODKEY,             XK_F11,       spawn,     {.v = cmusply} },
        { MODKEY,             XK_F12,       spawn,     {.v = cmusnxt} },
        { 0,                  0x1008ff12,   spawn,     {.v = volmute} },     
        { 0,                  0x1008ff11,   spawn,     {.v = voldwn} },
        { 0,                  0x1008ff13,   spawn,     {.v = volup} },
/*        { 0,                  0x1008ffb2,   spawn,      {.v = cmus} },*/
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
