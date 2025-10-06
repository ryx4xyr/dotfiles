const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0c0c0e", /* black   */
  [1] = "#384755", /* red     */
  [2] = "#4E5E6C", /* green   */
  [3] = "#81807E", /* yellow  */
  [4] = "#677886", /* blue    */
  [5] = "#768995", /* magenta */
  [6] = "#92A2AA", /* cyan    */
  [7] = "#d0d6da", /* white   */

  /* 8 bright colors */
  [8]  = "#919598",  /* black   */
  [9]  = "#384755",  /* red     */
  [10] = "#4E5E6C", /* green   */
  [11] = "#81807E", /* yellow  */
  [12] = "#677886", /* blue    */
  [13] = "#768995", /* magenta */
  [14] = "#92A2AA", /* cyan    */
  [15] = "#d0d6da", /* white   */

  /* special colors */
  [256] = "#0c0c0e", /* background */
  [257] = "#d0d6da", /* foreground */
  [258] = "#d0d6da",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
