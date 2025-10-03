const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0a0f0f", /* black   */
  [1] = "#433F3F", /* red     */
  [2] = "#59442F", /* green   */
  [3] = "#6C492D", /* yellow  */
  [4] = "#303B44", /* blue    */
  [5] = "#3A434C", /* magenta */
  [6] = "#5D4F4E", /* cyan    */
  [7] = "#bfa794", /* white   */

  /* 8 bright colors */
  [8]  = "#857467",  /* black   */
  [9]  = "#433F3F",  /* red     */
  [10] = "#59442F", /* green   */
  [11] = "#6C492D", /* yellow  */
  [12] = "#303B44", /* blue    */
  [13] = "#3A434C", /* magenta */
  [14] = "#5D4F4E", /* cyan    */
  [15] = "#bfa794", /* white   */

  /* special colors */
  [256] = "#0a0f0f", /* background */
  [257] = "#bfa794", /* foreground */
  [258] = "#bfa794",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
