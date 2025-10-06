static const char norm_fg[] = "#82cce1";
static const char norm_bg[] = "#030510";
static const char norm_border[] = "#5b8e9d";

static const char sel_fg[] = "#82cce1";
static const char sel_bg[] = "#3D4E69";
static const char sel_border[] = "#82cce1";

static const char urg_fg[] = "#82cce1";
static const char urg_bg[] = "#65124C";
static const char urg_border[] = "#65124C";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
