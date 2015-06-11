/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]            = "-misc-*-*-*-*-*-14-*-*-*-*-*-iso8859-1";
static const char normbordercolor[] = "#000000";
static const char normbgcolor[]     = "#000000";
static const char normfgcolor[]     = "#ffffff";
static const char selbordercolor[]  = "#000000";
static const char selbgcolor[]      = "#ff69b4";
static const char selfgcolor[]      = "#000000";
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */

/* tagging */
static const char *tags[] = { "Main", "Web", "Media", "4", "5", "6" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            True,        -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       False,       -1 },
};

/* layout(s) */
static const float mfact      = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const Bool resizehints = True; /* True means respect size hints in tiled resizals */

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
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "urxvt", NULL };

// custom commads //
static void x_nexttag(const Arg *arg);
static void x_prevtag(const Arg *arg);
static void x_adjtag(int n);
//	Tag Cycling From //
//	ap0calypse.agitatio.org/articles/2012/08/17/cycle-through-your-tags-in-dwm.html //
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

static const char *reboot[]    = { "/usr/bin/reboot", NULL };
static const char *shutdwn[]   = { "shutdown", "-h", "now", NULL };
static const char *scrnlck[]   = { "sflock", "-f", "10x20", NULL };
static const char *suspend[]   = { "systemctl", "suspend", NULL };
static const char *volmute[]   = { "amixer", "set", "Master", "toggle", NULL };
static const char *voldwn[]    = { "amixer", "set", "Master", "5%-", NULL };
static const char *volup[]     = { "amixer", "set", "Master", "5%+", NULL };
static const char *cmusstop[]  = { "cmus-remote", "-s", NULL };
static const char *cmusplay[]  = { "cmus-remote", "-u", NULL };
static const char *cmusfwd[]   = { "cmus-remote", "-n", NULL };
static const char *cmusbck[]   = { "cmus-remote", "-r", NULL };
static const char *prtsc[]     = { "scrot", NULL };
static const char *chrome[]    = { "chromium", NULL };
static const char *nightmode[] = { "xrandr", "--ouptut", "HDMI-0", "--brightness", "0.3", NULL };
static const char *daymode[]   = { "xrandr", "--output", "HDMI-0", "--brightness", "1", NULL };
/*
static const char *darken[]    = { "xbacklight", "-dec", "10", NULL };
static const char *brighten[]  = { "xbacklight", "-inc", "10", NULL };
*/

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_Left,   focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_l,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Right,  focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_r,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_v,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_h,      incnmaster,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_Left,   setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,             XK_Right,  setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_space,  view,           {0} },
	{ MODKEY,                       XK_F4,     killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_Tab,    setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_Tab,    togglefloating, {0} },
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
	{ MODKEY|ControlMask,           XK_Delete, quit,           {0} },

// custom keys //
	{ MODKEY|ShiftMask,		XK_space,  spawn,          {.v = reboot } },
	{ MODKEY|ControlMask,		XK_space,  spawn,          {.v = shutdwn } },
	{ MODKEY,			XK_Home,   spawn,          {.v = nightmode } },
	{ MODKEY,                       XK_End,    spawn,          {.v = daymode } },
	{ MODKEY,			XK_Next,   spawn,          {.v = voldwn } },
	{ MODKEY,			XK_Prior,  spawn,          {.v = volup } },
        { MODKEY,                       XK_c,      spawn,          {.v = chrome } },
	{ MODKEY,			XK_Up,     x_nexttag,      {0} },
	{ MODKEY,                       XK_Down,   x_prevtag,      {0} },
	{ MODKEY|ControlMask,		XK_Up,     spawn,          {.v = cmusstop } },
	{ MODKEY|ControlMask,		XK_Down,   spawn,          {.v = cmusplay } },
	{ MODKEY|ControlMask,		XK_Left,   spawn,          {.v = cmusbck } },
	{ MODKEY|ControlMask,		XK_Right,  spawn,          {.v = cmusfwd } },
	{ MODKEY|ControlMask,		XK_Return, spawn,          {.v = scrnlck } },
        { MODKEY|ControlMask,           XK_Return, spawn,          {.v = suspend } },
	{ 0,                            XK_Print,  spawn,          {.v = prtsc } },
} ;

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

