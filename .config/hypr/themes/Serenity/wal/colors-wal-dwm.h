static const char norm_fg[] = "#d2dade";
static const char norm_bg[] = "#121812";
static const char norm_border[] = "#93989b";

static const char sel_fg[] = "#d2dade";
static const char sel_bg[] = "#778EB0";
static const char sel_border[] = "#d2dade";

static const char urg_fg[] = "#d2dade";
static const char urg_bg[] = "#4F6E9A";
static const char urg_border[] = "#4F6E9A";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
