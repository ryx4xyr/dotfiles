static const char norm_fg[] = "#d0d6da";
static const char norm_bg[] = "#0c0c0e";
static const char norm_border[] = "#919598";

static const char sel_fg[] = "#d0d6da";
static const char sel_bg[] = "#4E5E6C";
static const char sel_border[] = "#d0d6da";

static const char urg_fg[] = "#d0d6da";
static const char urg_bg[] = "#384755";
static const char urg_border[] = "#384755";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
