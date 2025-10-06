const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0a0406", /* black   */
  [1] = "#56425C", /* red     */
  [2] = "#9A1D1A", /* green   */
  [3] = "#C44750", /* yellow  */
  [4] = "#787089", /* blue    */
  [5] = "#C96E95", /* magenta */
  [6] = "#6CB1D2", /* cyan    */
  [7] = "#e4d2d7", /* white   */

  /* 8 bright colors */
  [8]  = "#9f9396",  /* black   */
  [9]  = "#56425C",  /* red     */
  [10] = "#9A1D1A", /* green   */
  [11] = "#C44750", /* yellow  */
  [12] = "#787089", /* blue    */
  [13] = "#C96E95", /* magenta */
  [14] = "#6CB1D2", /* cyan    */
  [15] = "#e4d2d7", /* white   */

  /* special colors */
  [256] = "#0a0406", /* background */
  [257] = "#e4d2d7", /* foreground */
  [258] = "#e4d2d7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
