static const char norm_fg[] = "#c3aa97";
static const char norm_bg[] = "#1f0f10";
static const char norm_border[] = "#887669";

static const char sel_fg[] = "#c3aa97";
static const char sel_bg[] = "#9E201D";
static const char sel_border[] = "#c3aa97";

static const char urg_fg[] = "#c3aa97";
static const char urg_bg[] = "#6D452A";
static const char urg_border[] = "#6D452A";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
