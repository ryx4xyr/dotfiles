static const char norm_fg[] = "#e4d2d7";
static const char norm_bg[] = "#0a0406";
static const char norm_border[] = "#9f9396";

static const char sel_fg[] = "#e4d2d7";
static const char sel_bg[] = "#9A1D1A";
static const char sel_border[] = "#e4d2d7";

static const char urg_fg[] = "#e4d2d7";
static const char urg_bg[] = "#56425C";
static const char urg_border[] = "#56425C";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
