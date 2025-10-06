static const char norm_fg[] = "#bfa794";
static const char norm_bg[] = "#0a0f0f";
static const char norm_border[] = "#857467";

static const char sel_fg[] = "#bfa794";
static const char sel_bg[] = "#59442F";
static const char sel_border[] = "#bfa794";

static const char urg_fg[] = "#bfa794";
static const char urg_bg[] = "#433F3F";
static const char urg_border[] = "#433F3F";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
