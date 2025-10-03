static const char norm_fg[] = "#d9c1db";
static const char norm_bg[] = "#100a21";
static const char norm_border[] = "#978799";

static const char sel_fg[] = "#d9c1db";
static const char sel_bg[] = "#6559B9";
static const char sel_border[] = "#d9c1db";

static const char urg_fg[] = "#d9c1db";
static const char urg_bg[] = "#4E53B7";
static const char urg_border[] = "#4E53B7";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
