static const char norm_fg[] = "#aab8d2";
static const char norm_bg[] = "#0b101b";
static const char norm_border[] = "#768093";

static const char sel_fg[] = "#aab8d2";
static const char sel_bg[] = "#2C6DBD";
static const char sel_border[] = "#aab8d2";

static const char urg_fg[] = "#aab8d2";
static const char urg_bg[] = "#2C4FA1";
static const char urg_border[] = "#2C4FA1";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
