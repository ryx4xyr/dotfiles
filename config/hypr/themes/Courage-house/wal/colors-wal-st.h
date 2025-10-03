const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0d0416", /* black   */
  [1] = "#6F2B8D", /* red     */
  [2] = "#692A96", /* green   */
  [3] = "#704AA1", /* yellow  */
  [4] = "#9B339F", /* blue    */
  [5] = "#B0349C", /* magenta */
  [6] = "#9B4FA7", /* cyan    */
  [7] = "#c39ed9", /* white   */

  /* 8 bright colors */
  [8]  = "#886e97",  /* black   */
  [9]  = "#6F2B8D",  /* red     */
  [10] = "#692A96", /* green   */
  [11] = "#704AA1", /* yellow  */
  [12] = "#9B339F", /* blue    */
  [13] = "#B0349C", /* magenta */
  [14] = "#9B4FA7", /* cyan    */
  [15] = "#c39ed9", /* white   */

  /* special colors */
  [256] = "#0d0416", /* background */
  [257] = "#c39ed9", /* foreground */
  [258] = "#c39ed9",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
