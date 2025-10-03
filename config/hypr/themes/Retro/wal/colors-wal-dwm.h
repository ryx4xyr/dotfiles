static const char norm_fg[] = "#c5c0c1";
static const char norm_bg[] = "#0d1011";
static const char norm_border[] = "#898687";

static const char sel_fg[] = "#c5c0c1";
static const char sel_bg[] = "#994037";
static const char sel_border[] = "#c5c0c1";

static const char urg_fg[] = "#c5c0c1";
static const char urg_bg[] = "#606063";
static const char urg_border[] = "#606063";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
