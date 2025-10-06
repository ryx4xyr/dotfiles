static const char norm_fg[] = "#cf9a9b";
static const char norm_bg[] = "#000D19";
static const char norm_border[] = "#906b6c";

static const char sel_fg[] = "#cf9a9b";
static const char sel_bg[] = "#4E3C48";
static const char sel_border[] = "#cf9a9b";

static const char urg_fg[] = "#cf9a9b";
static const char urg_bg[] = "#233A48";
static const char urg_border[] = "#233A48";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
